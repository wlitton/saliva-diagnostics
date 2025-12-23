import 'dart:io';

import 'package:flutter/widgets.dart';

import 'food_entry.dart';

Widget buildEntryImageImpl(FoodEntry entry) {
  if (entry.imagePath == null) {
    return const SizedBox.shrink();
  }
  return Image.file(
    File(entry.imagePath!),
    fit: BoxFit.cover,
  );
}
