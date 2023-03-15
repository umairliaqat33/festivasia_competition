import 'dart:async';

import 'package:festivasia_competetion/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _createSplash() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        // User? user = FirebaseAuth.instance.currentUser;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _createSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset('assets/flutter.png'),
            ),
          ],
        ),
      ),
    );
  }
}
