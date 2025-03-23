import 'package:flutter/material.dart';
import 'package:soopfood/screens/register_screen/register_screen.dart';
import 'package:soopfood/screens/login_screen/forgot_password_screen.dart';

class AlternativeLoginOptions extends StatelessWidget {
  final Function() onGoogleSignIn;
  final Function() onGuestSignIn;

  AlternativeLoginOptions({
    required this.onGoogleSignIn,
    required this.onGuestSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Create an account',
                  style: TextStyle(color: Colors.blueAccent)),
            ),
            SizedBox(width: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen()),
                );
              },
              child: Text('Forgot Password?',
                  style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: onGoogleSignIn,
          icon: Icon(Icons.g_mobiledata),
          label: Text('Sign in with Google'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: Size(double.infinity, 0),
          ),
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: onGuestSignIn,
          child: Text('Login as Guest'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: Size(double.infinity, 0),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
