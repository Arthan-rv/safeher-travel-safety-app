import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const SafeHerTravelApp());
}

class SafeHerTravelApp extends StatelessWidget {
  const SafeHerTravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHer Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFF8F9FE),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6B4CE6),
          secondary: Color(0xFFFF6B9D),
          tertiary: Color(0xFF4ECDC4),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
