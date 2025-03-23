import 'package:flutter/material.dart';

class EmailLoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String, String) onLogin;
  final Function(String) onUpdateEmail;
  final Function(String) onUpdatePassword;

  const EmailLoginForm({
    super.key,
    required this.formKey,
    required this.onLogin,
    required this.onUpdateEmail,
    required this.onUpdatePassword,
  });

  @override
  _EmailLoginFormState createState() => _EmailLoginFormState();
}

class _EmailLoginFormState extends State<EmailLoginForm> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            validator: (val) {
              if (val == null || val.isEmpty) return 'Enter an email';
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
                return 'Enter a valid email';
              }
              return null;
            },
            onChanged: (val) {
              setState(() => email = val);
              widget.onUpdateEmail(val);
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            obscureText: true,
            validator: (val) {
              if (val == null || val.isEmpty) return 'Enter a password';
              if (val.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            onChanged: (val) {
              setState(() => password = val);
              widget.onUpdatePassword(val);
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(double.infinity, 0),
            ),
            child: Text('Login', style: TextStyle(fontSize: 18)),
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                widget.onLogin(email, password);
              }
            },
          ),
        ],
      ),
    );
  }
}
