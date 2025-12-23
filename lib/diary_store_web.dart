import 'dart:convert';

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
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final entry = FoodEntry(
      id: 'food_$timestamp',
      createdAt: DateTime.now(),
      imageData: base64Encode(bytes),
    );
    final updated = <FoodEntry>[entry, ...entries];
    await _persist(updated);
    return entry;
  }

  Future<void> _persist(List<FoodEntry> entries) async {
    final prefs = await SharedPreferences.getInstance();
    final payload = jsonEncode(entries.map((entry) => entry.toJson()).toList());
    await prefs.setString(_entriesKey, payload);
  }
}
