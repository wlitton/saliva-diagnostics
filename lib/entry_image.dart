import 'package:flutter/widgets.dart';

import 'entry_image_io.dart' if (dart.library.html) 'entry_image_web.dart';
import 'food_entry.dart';

Widget buildEntryImage(FoodEntry entry) => buildEntryImageImpl(entry);
