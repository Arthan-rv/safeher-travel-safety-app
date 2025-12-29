import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/sos_service.dart';


class SosSentPage extends StatelessWidget {
  final String sosId;

  const SosSentPage({
    super.key,
    required this.sosId,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1F3B),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.check_circle_outline,
                    color: Colors.greenAccent, size: 90),
                const SizedBox(height: 24),
                const Text(
                  'SOS ALERT SENT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your trusted contacts have been notified.\nLive location sharing is active.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    HapticFeedback.mediumImpact();
                    await SosService().resolveSOS(sosId);
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "I'M SAFE",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
