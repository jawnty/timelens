import 'dart:io';
import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../models/history_entry.dart';

class HistoryService {
  static const String _boxName = 'history';
  static const String _imageFolder = 'timelens_history';

  Box? _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  Future<String> _getImageDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final imageDir = Directory('${appDir.path}/$_imageFolder');
    if (!await imageDir.exists()) {
      await imageDir.create(recursive: true);
    }
    return imageDir.path;
  }

  Future<HistoryEntry> saveToHistory({
    required String userId,
    required String eraName,
    required String eraYear,
    required Uint8List imageBytes,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final imageDir = await _getImageDirectory();
    final imagePath = '$imageDir/$id.jpg';

    // Save image to file
    final file = File(imagePath);
    await file.writeAsBytes(imageBytes);

    // Create history entry
    final entry = HistoryEntry(
      id: id,
      userId: userId,
      eraName: eraName,
      eraYear: eraYear,
      imagePath: imagePath,
      createdAt: DateTime.now(),
    );

    // Save to Hive
    await _box?.put(id, entry.toMap());

    return entry;
  }

  List<HistoryEntry> getHistoryForUser(String userId) {
    if (_box == null) return [];

    final entries = <HistoryEntry>[];
    for (var key in _box!.keys) {
      final map = _box!.get(key);
      if (map != null) {
        final entry = HistoryEntry.fromMap(map);
        if (entry.userId == userId) {
          entries.add(entry);
        }
      }
    }

    // Sort by date, newest first
    entries.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return entries;
  }

  Future<void> deleteEntry(String id) async {
    final map = _box?.get(id);
    if (map != null) {
      final entry = HistoryEntry.fromMap(map);
      // Delete the image file
      final file = File(entry.imagePath);
      if (await file.exists()) {
        await file.delete();
      }
      // Delete from Hive
      await _box?.delete(id);
    }
  }

  Future<void> clearHistoryForUser(String userId) async {
    if (_box == null) return;

    final keysToDelete = <String>[];
    for (var key in _box!.keys) {
      final map = _box!.get(key);
      if (map != null) {
        final entry = HistoryEntry.fromMap(map);
        if (entry.userId == userId) {
          // Delete the image file
          final file = File(entry.imagePath);
          if (await file.exists()) {
            await file.delete();
          }
          keysToDelete.add(key.toString());
        }
      }
    }

    for (var key in keysToDelete) {
      await _box?.delete(key);
    }
  }
}
