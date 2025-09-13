import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = 'Fitrecipe – Hellmill | Havi kihívás: futópad + has. Kontakt: hellmill@fitrecipe.app';
    return Scaffold(
      appBar: AppBar(title: const Text('Profil & Megosztás')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('QR megosztás', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    QrImageView(data: summary, size: 180),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => Share.share(summary),
              child: const Text('Megosztás szövegként'),
            ),
          ],
        ),
      ),
    );
  }
}
