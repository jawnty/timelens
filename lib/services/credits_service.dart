import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_credits.dart';
import '../config/allowlist.dart';

class CreditsService extends ChangeNotifier {
  static const String _boxName = 'credits';

  Box? _box;
  UserCredits? _currentCredits;
  String? _currentUserId;

  UserCredits? get currentCredits => _currentCredits;
  bool get isAllowlistedUser => _currentUserId != null && isAllowlisted(_currentEmail);
  String? _currentEmail;

  Future<void> init() async {
    _box = await Hive.openBox(_boxName);
  }

  /// Check if an email is on the allowlist for unlimited access
  bool isAllowlisted(String? email) {
    if (email == null) return false;
    return allowlistedEmails.contains(email.toLowerCase());
  }

  /// Load credits for a user, creating new record if needed
  Future<void> loadCredits(String userId, String? email) async {
    _currentUserId = userId;
    _currentEmail = email;

    final map = _box?.get(userId);
    if (map != null) {
      _currentCredits = UserCredits.fromMap(map);
    } else {
      _currentCredits = UserCredits.newUser(userId);
      await _saveCredits();
    }
    notifyListeners();
  }

  /// Check if user can perform a transformation
  bool canTransform() {
    return _currentCredits?.canTransform ?? false;
  }

  /// Get display text for credits badge
  String getCreditsDisplayText() {
    if (_currentCredits == null) return '...';

    final credits = _currentCredits!;
    final total = credits.totalAvailable;

    // Show total available credits
    if (credits.hasFreeTransformations && credits.balance == 0) {
      // Only free credits remaining
      return '${credits.freeRemaining} free';
    }
    return '$total';
  }

  /// Use one credit (call after successful transformation)
  /// Returns true if credit was successfully used
  Future<bool> useCredit() async {
    if (_currentCredits == null) return false;

    final credits = _currentCredits!;

    if (credits.hasFreeTransformations) {
      // Use a free transformation
      _currentCredits = credits.copyWith(
        freeUsed: credits.freeUsed + 1,
        lastUpdated: DateTime.now(),
      );
    } else if (credits.balance > 0) {
      // Use a paid credit
      _currentCredits = credits.copyWith(
        balance: credits.balance - 1,
        lastUpdated: DateTime.now(),
      );
    } else {
      return false;
    }

    await _saveCredits();
    notifyListeners();
    return true;
  }

  /// Add credits to user's balance (called after purchase)
  Future<void> addCredits(int amount) async {
    if (_currentCredits == null) return;

    _currentCredits = _currentCredits!.copyWith(
      balance: _currentCredits!.balance + amount,
      lastUpdated: DateTime.now(),
    );

    await _saveCredits();
    notifyListeners();
  }

  /// Clear credits for current user (for testing)
  Future<void> clearCredits() async {
    if (_currentUserId == null) return;

    _currentCredits = UserCredits.newUser(_currentUserId!);
    await _saveCredits();
    notifyListeners();
  }

  Future<void> _saveCredits() async {
    if (_currentCredits != null && _currentUserId != null) {
      await _box?.put(_currentUserId, _currentCredits!.toMap());
    }
  }
}
