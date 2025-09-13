import 'dart:async';
import 'package:flutter/material.dart';

class TabataTimerPage extends StatefulWidget {
  const TabataTimerPage({super.key});
  @override
  State<TabataTimerPage> createState() => _TabataTimerPageState();
}

class _TabataTimerPageState extends State<TabataTimerPage> {
  int workSec = 20;
  int restSec = 10;
  int rounds = 8;

  int currentRound = 0;
  int current = 20;
  bool isWork = true;
  Timer? _t;

  void _start() {
    _t?.cancel();
    setState(() {
      currentRound = 1;
      isWork = true;
      current = workSec;
    });
    _t = Timer.periodic(const Duration(seconds: 1), (t) {
      if (current > 0) {
        setState(() => current--);
      } else {
        if (isWork) {
          setState(() {
            isWork = false;
            current = restSec;
          });
        } else {
          if (currentRound >= rounds) {
            t.cancel();
            setState(() {});
          } else {
            setState(() {
              currentRound++;
              isWork = true;
              current = workSec;
            });
          }
        }
      }
    });
  }

  void _stop() {
    _t?.cancel();
    setState(() {});
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = isWork ? Colors.greenAccent : Colors.orangeAccent;
    return Scaffold(
      appBar: AppBar(title: const Text('Tabata időzítő')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Expanded(child: _numField('Work (s)', workSec, (v){ setState(()=>workSec=v); })),
              const SizedBox(width: 12),
              Expanded(child: _numField('Rest (s)', restSec, (v){ setState(()=>restSec=v); })),
              const SizedBox(width: 12),
              Expanded(child: _numField('Rounds', rounds, (v){ setState(()=>rounds=v); })),
            ]),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Kör: $currentRound / $rounds', style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 8),
                    Text(isWork ? 'MUNKA' : 'PIHENŐ', style: TextStyle(fontSize: 18, color: color)),
                    const SizedBox(height: 12),
                    Text('$current', style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: FilledButton(onPressed: _start, child: const Text('Start'))),
                const SizedBox(width: 12),
                Expanded(child: OutlinedButton(onPressed: _stop, child: const Text('Stop'))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _numField(String label, int value, void Function(int) onChanged) {
    final c = TextEditingController(text: value.toString());
    return TextField(
      controller: c,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
      onSubmitted: (s) {
        final v = int.tryParse(s) ?? value;
        onChanged(v);
      },
    );
  }
}
