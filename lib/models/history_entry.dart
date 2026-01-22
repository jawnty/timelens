class HistoryEntry {
  final String id;
  final String userId;
  final String eraName;
  final String eraYear;
  final String imagePath;
  final DateTime createdAt;

  HistoryEntry({
    required this.id,
    required this.userId,
    required this.eraName,
    required this.eraYear,
    required this.imagePath,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'eraName': eraName,
      'eraYear': eraYear,
      'imagePath': imagePath,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory HistoryEntry.fromMap(Map<dynamic, dynamic> map) {
    return HistoryEntry(
      id: map['id'] as String,
      userId: map['userId'] as String,
      eraName: map['eraName'] as String,
      eraYear: map['eraYear'] as String,
      imagePath: map['imagePath'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
