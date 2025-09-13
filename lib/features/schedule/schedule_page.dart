import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final noti = FlutterLocalNotificationsPlugin();
  TimeOfDay? time;

  @override
  void initState() {
    super.initState();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    noti.initialize(const InitializationSettings(android: android));
  }

  Future<void> scheduleSimple() async {
    await noti.show(
      1002,
      'Edzés idő!',
      'Futópad + has – indulj!',
      const NotificationDetails(
        android: AndroidNotificationDetails('fitrecipe','reminder', importance: Importance.max, priority: Priority.high),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edzés ütemező')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Gyors motivációs értesítés (demo):'),
            const SizedBox(height: 12),
            FilledButton(onPressed: scheduleSimple, child: const Text('Értesítés küldése most')),
            const SizedBox(height: 24),
            const Text('Megjegyzés: időzített, napi ismétlődő értesítéshez érdemes a timezone csomagot bekötni.'),
          ],
        ),
      ),
    );
  }
}
