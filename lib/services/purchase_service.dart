import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../models/credit_pack.dart';
import 'credits_service.dart';

class PurchaseService extends ChangeNotifier {
  final InAppPurchase _iap = InAppPurchase.instance;
  final CreditsService _creditsService;

  StreamSubscription<List<PurchaseDetails>>? _subscription;
  List<ProductDetails> _products = [];
  bool _available = false;
  bool _loading = false;
  String? _error;

  bool get isAvailable => _available;
  bool get isLoading => _loading;
  String? get error => _error;
  List<ProductDetails> get products => _products;

  PurchaseService(this._creditsService);

  Future<void> init() async {
    _available = await _iap.isAvailable();
    if (!_available) {
      _error = 'Store not available';
      notifyListeners();
      return;
    }

    // Listen to purchase updates
    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdated,
      onError: (error) {
        _error = error.toString();
        notifyListeners();
      },
    );

    await loadProducts();
  }

  Future<void> loadProducts() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final productIds = creditPacks.map((p) => p.productId).toSet();
      final response = await _iap.queryProductDetails(productIds);

      if (response.notFoundIDs.isNotEmpty) {
        debugPrint('Products not found: ${response.notFoundIDs}');
      }

      _products = response.productDetails;
      _loading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> buyCredits(CreditPack pack) async {
    // Find the product details for this pack
    final product = _products.firstWhere(
      (p) => p.id == pack.productId,
      orElse: () => throw Exception('Product not found: ${pack.productId}'),
    );

    final purchaseParam = PurchaseParam(productDetails: product);
    await _iap.buyConsumable(purchaseParam: purchaseParam);
  }

  void _onPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    for (final purchase in purchaseDetailsList) {
      _handlePurchase(purchase);
    }
  }

  Future<void> _handlePurchase(PurchaseDetails purchase) async {
    if (purchase.status == PurchaseStatus.pending) {
      // Show pending UI
      debugPrint('Purchase pending: ${purchase.productID}');
    } else if (purchase.status == PurchaseStatus.error) {
      _error = purchase.error?.message ?? 'Purchase failed';
      notifyListeners();
    } else if (purchase.status == PurchaseStatus.purchased ||
        purchase.status == PurchaseStatus.restored) {
      // Verify and deliver the product
      await _deliverProduct(purchase);
    } else if (purchase.status == PurchaseStatus.canceled) {
      debugPrint('Purchase canceled: ${purchase.productID}');
    }

    // Complete the purchase
    if (purchase.pendingCompletePurchase) {
      await _iap.completePurchase(purchase);
    }
  }

  Future<void> _deliverProduct(PurchaseDetails purchase) async {
    // Find the credit pack for this product
    final pack = creditPacks.firstWhere(
      (p) => p.productId == purchase.productID,
      orElse: () => throw Exception('Unknown product: ${purchase.productID}'),
    );

    // Add credits to user's balance
    await _creditsService.addCredits(pack.credits);

    debugPrint('Delivered ${pack.credits} credits for ${purchase.productID}');
  }

  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
