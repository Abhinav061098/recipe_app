import 'package:flutter/material.dart';

class ProfileAnonymousMessage extends StatelessWidget {
  const ProfileAnonymousMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Login to access more features and personalize your profile.",
          style: TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
