import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/storage/hive_boxes.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  late final Box<bool> box;
  final items = [
    'Bemelegítés 5 perc',
    'Futópad – intervall 10 kör',
    'Has – 10 perc',
    'Nyújtás 5 perc',
  ];

  @override
  void initState() {
    super.initState();
    box = Hive.box<bool>(HiveBoxes.checklistBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Napi checklist')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, i) {
          final done = box.get('i$i', defaultValue: false) ?? false;
          return CheckboxListTile(
            title: Text(items[i]),
            value: done,
            onChanged: (v) => setState(() => box.put('i$i', v ?? false)),
          );
        },
      ),
    );
  }
}
