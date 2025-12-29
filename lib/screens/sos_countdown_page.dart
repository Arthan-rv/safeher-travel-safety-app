import 'dart:async';
import 'package:flutter/material.dart';
import 'sos_sent_page.dart';
import '../services/sos_service.dart';


class SosCountdownPage extends StatefulWidget {
  const SosCountdownPage({super.key});

  @override
  State<SosCountdownPage> createState() => _SosCountdownPageState();
}

class _SosCountdownPageState extends State<SosCountdownPage> {
  int _secondsRemaining = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 1) {
        timer.cancel();
        _onCountdownComplete();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  Future<void> _onCountdownComplete() async {
  final sosService = SosService();

  // Mock coordinates for now (replace with GPS later)
  final sosId = await sosService.triggerSOS(
    lat: 9.9252,
    lng: 78.1198,
  );

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => SosSentPage(sosId: sosId),
    ),
  );
}

  void _cancelSOS() {
    _timer?.cancel();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.white, size: 80),
                  const SizedBox(height: 20),
                  const Text(
                    'Sending SOS...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '$_secondsRemaining',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 72,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Hold tight. Help will be alerted shortly.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: _cancelSOS,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                    ),
                    child: const Text('CANCEL'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
