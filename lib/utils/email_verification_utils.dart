import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> sendVerificationEmail(BuildContext context, String email) async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null && email != 'Update Email') {
    try {
      await user.verifyBeforeUpdateEmail(email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification email sent.'),
          duration: Duration(seconds: 5),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sending verification email: ${e.message}'),
          duration: const Duration(seconds: 5),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sending verification email: $e'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }
}

Future<void> checkEmailVerification(BuildContext context) async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.reload();
    if (user.emailVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email verified successfully!'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
