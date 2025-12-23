import 'diary_store_io.dart' if (dart.library.html) 'diary_store_web.dart';
import 'food_entry.dart';

abstract class DiaryStore {
  Future<List<FoodEntry>> loadEntries();
  Future<FoodEntry> saveImageBytes(List<int> bytes, String extension);
}

DiaryStore createDiaryStore() => DiaryStoreImpl();
