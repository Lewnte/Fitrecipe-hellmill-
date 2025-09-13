import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/tabata/timer_page.dart';
import 'features/weekly/weekly_plan_page.dart';
import 'features/checklist/checklist_page.dart';
import 'features/schedule/schedule_page.dart';
import 'features/profile/profile_page.dart';
import 'core/storage/hive_boxes.dart';

class MyApp extends StatefulWidget {
  final String env;
  const MyApp({super.key, required this.env});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  final _pages = const [
    TabataTimerPage(),
    WeeklyPlanPage(),
    ChecklistPage(),
    SchedulePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    HiveBoxes.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitrecipe – Hellmill (${String.fromCharCodes([0x1F525])})',
      theme: AppTheme.dark(),
      home: Scaffold(
        body: SafeArea(child: _pages[_index]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.timer), label: 'Tabata'),
            NavigationDestination(icon: Icon(Icons.calendar_view_week), label: 'Hét'),
            NavigationDestination(icon: Icon(Icons.check_circle), label: 'Checklist'),
            NavigationDestination(icon: Icon(Icons.schedule), label: 'Ütemező'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
          ],
          onDestinationSelected: (i) => setState(() => _index = i),
        ),
      ),
    );
  }
}
