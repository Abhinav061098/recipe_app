import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../services/auth_service.dart';

class VerifyPhoneOtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  final String username;

  const VerifyPhoneOtpScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
    required this.username,
  });

  @override
  _VerifyPhoneOtpScreenState createState() => _VerifyPhoneOtpScreenState();
}

class _VerifyPhoneOtpScreenState extends State<VerifyPhoneOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  String smsCode = '';
  final AuthService _auth = AuthService();
  bool _loading = false;
  String _error = '';

  Future<void> _verifyOTP() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
        _error = '';
      });
      try {
        User? user = await _auth.signInWithPhone(widget.verificationId, smsCode,
            widget.username, widget.phoneNumber);
        if (user != null) {
          // Success
          Navigator.pop(context);
        } else {
          setState(() {
            _error = 'Verification failed';
          });
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          _error = e.message ?? 'Verification failed';
        });
      } finally {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Verification ID: ${widget.verificationId}'),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter OTP';
                    }
                    return null;
                  },
                  onChanged: (val) => smsCode = val,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loading ? null : _verifyOTP,
                  child: _loading
                      ? CircularProgressIndicator()
                      : Text('Verify OTP'),
                ),
                if (_error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      _error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
