import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'food_entry.dart';
import 'diary_store.dart';

class DiaryStoreImpl implements DiaryStore {
  static const _entriesKey = 'food_entries';

  @override
  Future<List<FoodEntry>> loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_entriesKey);
    if (raw == null || raw.isEmpty) {
      return <FoodEntry>[];
    }
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((entry) => FoodEntry.fromJson(entry as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<FoodEntry> saveImageBytes(List<int> bytes, String extension) async {
    final entries = await loadEntries();
    final directory = await _ensureImageDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final safeExtension = extension.isEmpty ? 'jpg' : extension;
    final filePath = path.join(directory.path, 'food_$timestamp.$safeExtension');
    final file = File(filePath);
    await file.writeAsBytes(bytes, flush: true);

    final entry = FoodEntry(
      id: 'food_$timestamp',
      createdAt: DateTime.now(),
      imagePath: filePath,
    );
    final updated = <FoodEntry>[entry, ...entries];
    await _persist(updated);
    return entry;
  }

  Future<Directory> _ensureImageDirectory() async {
    final baseDir = await getApplicationDocumentsDirectory();
    final imageDir = Directory(path.join(baseDir.path, 'food_images'));
    if (!await imageDir.exists()) {
      await imageDir.create(recursive: true);
    }
    return imageDir;
  }

  Future<void> _persist(List<FoodEntry> entries) async {
    final prefs = await SharedPreferences.getInstance();
    final payload = jsonEncode(entries.map((entry) => entry.toJson()).toList());
    await prefs.setString(_entriesKey, payload);
  }
}
