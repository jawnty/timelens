import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AllowlistService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Set<String> _allowlistedEmails = {};
  bool _loaded = false;

  bool get isLoaded => _loaded;

  Future<void> loadAllowlist() async {
    try {
      final snapshot = await _firestore.collection('allowlist').get();
      _allowlistedEmails = snapshot.docs
          .map((doc) => (doc.data()['email'] as String?)?.toLowerCase())
          .where((email) => email != null)
          .cast<String>()
          .toSet();
      _loaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading allowlist: $e');
      _allowlistedEmails = {};
      _loaded = true;
    }
  }

  bool isAllowlisted(String? email) {
    if (email == null) return false;
    return _allowlistedEmails.contains(email.toLowerCase());
  }
}
