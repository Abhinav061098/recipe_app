import 'package:flutter/material.dart';
import 'package:soopfood/screens/login_screen/verify_Phone_Otp_Screen.dart';
import '../../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneLoginForm extends StatefulWidget {
  final Function(bool) setLoading;
  final Function(String) setError;
  final Function(String) onLoginSuccess;

  const PhoneLoginForm({
    super.key,
    required this.setLoading,
    required this.setError,
    required this.onLoginSuccess,
  });

  @override
  _PhoneLoginFormState createState() => _PhoneLoginFormState();
}

class _PhoneLoginFormState extends State<PhoneLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String phoneNumber = '';
  String password = '';
  bool _usePassword = false;

  void _sendOtpToPhone(String phoneNumber) {
    widget.setLoading(true);
    widget.setError('');
    _auth.sendOtpToPhone(
      phoneNumber,
      (PhoneAuthCredential credential) {},
      (FirebaseAuthException authException) {
        widget.setError(authException.message ??
            "Error occurred during phone verification.");
        widget.setLoading(false);
      },
      (String verificationId, int? forceResendingToken) {
        widget.setLoading(false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyPhoneOtpScreen(
              verificationId: verificationId,
              phoneNumber: phoneNumber,
              username: '',
            ),
          ),
        );
      },
      (String verificationId) {},
    );
  }

  Future<void> _signInWithPhoneAndPassword() async {
    widget.setLoading(true);
    widget.setError('');
    try {
      User? user =
          await _auth.signInWithPhoneAndPassword(phoneNumber, password);
      if (user != null) {
        widget.setLoading(false);
        widget.onLoginSuccess('Login Successful!');
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        widget.setError("Login failed");
        widget.setLoading(false);
      }
    } on FirebaseAuthException catch (e) {
      widget.setError(e.message ?? "Login failed");
      widget.setLoading(false);
    } catch (e) {
      widget.setError(e.toString());
      widget.setLoading(false);
    }
  }

  String? validatePassword(String? value) {
    if (_usePassword && (value == null || value.isEmpty)) {
      return 'Enter a password';
    }
    if (_usePassword && value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildTextField(
            label: 'Phone Number',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter a phone number';
              }
              if (!RegExp(r'^\+[1-9]\d{1,14}$').hasMatch(val)) {
                return 'Enter a valid phone number in E.164 format (e.g., +1234567890)';
              }
              return null;
            },
            onChanged: (val) => setState(() => phoneNumber = val),
          ),
          Row(
            children: [
              Checkbox(
                value: _usePassword,
                onChanged: (bool? value) {
                  setState(() {
                    _usePassword = value ?? false;
                  });
                },
              ),
              Text('Login with Password'),
            ],
          ),
          if (_usePassword) ...[
            _buildTextField(
              label: 'Password',
              icon: Icons.lock,
              obscureText: true,
              validator: validatePassword,
              onChanged: (val) => setState(() => password = val),
            ),
          ],
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: Size(double.infinity, 0),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (_usePassword) {
                  _signInWithPhoneAndPassword();
                } else {
                  _sendOtpToPhone(phoneNumber);
                }
              }
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black54),
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
