import 'package:flutter/material.dart';

class ProfileEmail extends StatelessWidget {
  final String email;
  final bool isEditingEmail;
  final TextEditingController emailController;
  final bool isAnonymous;
  final bool emailUpdated;
  final VoidCallback onSendVerificationEmail;
  final VoidCallback onEditSavePressed;
  final bool showEditIcon;
  final bool showVerifyButton; // Add showVerifyButton parameter

  const ProfileEmail({
    Key? key,
    required this.email,
    required this.isEditingEmail,
    required this.emailController,
    required this.isAnonymous,
    required this.emailUpdated,
    required this.onSendVerificationEmail,
    required this.onEditSavePressed,
    this.showEditIcon = true,
    this.showVerifyButton = false, // Default to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (showEditIcon)
              IconButton(
                icon: Icon(isEditingEmail ? Icons.save : Icons.edit),
                onPressed: onEditSavePressed,
              ),
          ],
        ),
        if (isEditingEmail)
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          )
        else
          Row(
            children: [
              Expanded(child: Text(email)),
              if (!isAnonymous &&
                  !emailUpdated &&
                  showVerifyButton) // Conditionally show
                TextButton(
                  onPressed: onSendVerificationEmail,
                  child: Text('Verify'),
                ),
            ],
          ),
      ],
    );
  }
}
