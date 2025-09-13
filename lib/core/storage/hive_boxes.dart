import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  static const weeklyBox = 'weekly_box';
  static const checklistBox = 'checklist_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(weeklyBox);
    await Hive.openBox<bool>(checklistBox);
  }
}
