import 'package:flutter/material.dart';

class ProfileDarkMode extends StatelessWidget {
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;

  const ProfileDarkMode({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          Switch(
            value: darkMode,
            activeColor: Colors.deepOrangeAccent,
            onChanged: onDarkModeChanged,
          ),
        ],
      ),
    );
  }
}
