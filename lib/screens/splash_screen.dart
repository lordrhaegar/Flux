import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _checkThemeMode();
    Timer(const Duration(milliseconds: 1500), _navigateToHomePage);
  }

  void _checkThemeMode() {
    final brightness = SchedulerBinding.instance!.window.platformBrightness;
    setState(() {
      _isDarkMode = brightness == Brightness.dark;
    });
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 500.0,
          height: 500.0,
        ),
      ),
    );
  }
}
