import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_application/screens/auth_screen.dart';
import 'package:flutter_chat_application/screens/dashboard_screen.dart';
import 'package:flutter_chat_application/screens/splash_screen.dart';

class FlutterChat extends StatelessWidget {
  const FlutterChat({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: SplashScreen());
        }

        if (snapshot.hasData) {
          return DashboardScreen();
        }

        return AuthScreen();
      },
    );
  }
}
