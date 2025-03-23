import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../screens/login_screen/login_screen.dart';
import '../../main.dart';

class ProfileLogoutButton extends StatelessWidget {
  final bool isAnonymous;

  const ProfileLogoutButton({super.key, required this.isAnonymous});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (isAnonymous) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          } else {
            await auth.signOut();
            if (context.mounted) {
              themeModeNotifier.value = ThemeMode.light;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrangeAccent,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          isAnonymous ? 'Login' : 'Logout',
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
