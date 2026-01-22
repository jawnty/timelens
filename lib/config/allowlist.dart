/// DEPRECATED: Allowlist is now managed via Firestore.
///
/// To manage the allowlist:
/// 1. Go to Firebase Console → Firestore
/// 2. Collection: 'allowlist'
/// 3. Add documents with field: email (string)
///
/// Example document:
///   { "email": "john.thomas@gmail.com" }
///
/// This file is kept for reference only.
@Deprecated('Use Firestore allowlist collection instead')
const Set<String> allowlistedEmails = {};
