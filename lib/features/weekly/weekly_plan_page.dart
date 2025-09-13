import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/storage/hive_boxes.dart';

class WeeklyPlanPage extends StatefulWidget {
  const WeeklyPlanPage({super.key});

  @override
  State<WeeklyPlanPage> createState() => _WeeklyPlanPageState();
}

class _WeeklyPlanPageState extends State<WeeklyPlanPage> {
  final days = const ['H', 'K', 'Sze', 'Cs', 'P', 'Szo', 'V'];
  late final Box<String> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<String>(HiveBoxes.weeklyBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heti edzésterv')),
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (_, i) {
          final key = 'day_$i';
          final text = box.get(key, defaultValue: '') ?? '';
          final controller = TextEditingController(text: text);
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(days[i], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Edzés leírása...', border: OutlineInputBorder()),
                    maxLines: null,
                    onChanged: (v) => box.put(key, v),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
