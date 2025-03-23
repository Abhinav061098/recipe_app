import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soopfood/screens/login_screen/login_screen.dart';
import '../services/auth_service.dart';

import '../screens/navigation_bar_screen/home_screen.dart';
import 'package:soopfood/main.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          themeModeNotifier.value = ThemeMode.light;
          return LoginScreen();
        }
      },
    );
  }
}
