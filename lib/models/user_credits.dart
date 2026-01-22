class UserCredits {
  final String userId;
  final int balance;
  final int freeUsed;
  final DateTime lastUpdated;

  static const int maxFreeTransformations = 10;

  UserCredits({
    required this.userId,
    required this.balance,
    required this.freeUsed,
    required this.lastUpdated,
  });

  bool get hasFreeTransformations => freeUsed < maxFreeTransformations;
  int get freeRemaining => maxFreeTransformations - freeUsed;
  bool get canTransform => hasFreeTransformations || balance > 0;
  int get totalAvailable => freeRemaining + balance;

  UserCredits copyWith({
    String? userId,
    int? balance,
    int? freeUsed,
    DateTime? lastUpdated,
  }) {
    return UserCredits(
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
      freeUsed: freeUsed ?? this.freeUsed,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'balance': balance,
      'freeUsed': freeUsed,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  factory UserCredits.fromMap(Map<dynamic, dynamic> map) {
    return UserCredits(
      userId: map['userId'] as String,
      balance: map['balance'] as int? ?? 0,
      freeUsed: map['freeUsed'] as int? ?? 0,
      lastUpdated: DateTime.parse(map['lastUpdated'] as String),
    );
  }

  factory UserCredits.newUser(String userId) {
    return UserCredits(
      userId: userId,
      balance: 0,
      freeUsed: 0,
      lastUpdated: DateTime.now(),
    );
  }
}
