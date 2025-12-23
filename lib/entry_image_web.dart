import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'food_entry.dart';

Widget buildEntryImageImpl(FoodEntry entry) {
  if (entry.imageData == null) {
    return const SizedBox.shrink();
  }
  return Image.memory(
    base64Decode(entry.imageData!),
    fit: BoxFit.cover,
  );
}
