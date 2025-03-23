import 'package:flutter/material.dart';
import '../../../../services/auth_service.dart'; // Adjust the path as needed
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmailRegisterForm extends StatefulWidget {
  final Function(bool) setLoading;
  final Function(String) setError;
  final Function(String)
      onRegistrationSuccess; // New callback for success message

  const EmailRegisterForm({
    super.key,
    required this.setLoading,
    required this.setError,
    required this.onRegistrationSuccess, // Pass the callback
  });

  @override
  _EmailRegisterFormState createState() => _EmailRegisterFormState();
}

class _EmailRegisterFormState extends State<EmailRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String confirmPassword = '';
  String username = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _saveUserData(User user, String username) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'username': username,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
      });
    } catch (e) {
      print("Error saving user data: $e");
      widget.setError("Failed to save user data. Please try again.");
      widget.setLoading(false);
      rethrow;
    }
  }

  Future<void> _registerWithEmailAndPassword() async {
    if (_formKey.currentState!.validate()) {
      widget.setLoading(true);
      widget.setError('');
      try {
        User? user =
            await _auth.registerWithEmailAndPassword(email, password, username);
        if (user != null) {
          await _saveUserData(user, username);

          // Notify success through the callback
          widget.onRegistrationSuccess(
              'Registration Successful! Please login to continue.'); // Pass success message

          widget.setLoading(false);
        } else {
          widget.setError('Registration failed. Please try again.');
          widget.setLoading(false);
        }
      } catch (e) {
        print(e.toString());
        widget.setError(e.toString());
        widget.setLoading(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Username TextField
          _buildTextField(
            label: 'Username',
            icon: Icons.person,
            validator: (val) =>
                val == null || val.isEmpty ? 'Enter a username' : null,
            onChanged: (val) => setState(() => username = val),
          ),

          // Email TextField
          _buildTextField(
            label: 'Email',
            icon: Icons.email,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter an email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
                return 'Enter a valid email';
              }
              return null;
            },
            onChanged: (val) => setState(() => email = val),
          ),

          // Password TextField
          _buildTextField(
            label: 'Password',
            icon: Icons.lock,
            obscureText: true,
            validator: _validatePassword,
            onChanged: (val) => setState(() => password = val),
          ),

          // Confirm Password TextField
          _buildTextField(
            label: 'Confirm Password',
            icon: Icons.lock,
            obscureText: true,
            validator: _validateConfirmPassword,
            onChanged: (val) => setState(() => confirmPassword = val),
          ),

          SizedBox(height: 20), // Reduced space for a more compact layout

          // Register Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 12, horizontal: 40), // Reduced padding
              elevation: 5, // Subtle shadow effect
            ),
            onPressed: _registerWithEmailAndPassword,
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 16, // Reduced font size for sleeker look
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom method to build the TextFields with icons and improved styling
  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    required String? Function(String?) validator,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Reduced padding
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black54), // Slightly muted label
          prefixIcon: Icon(icon, color: Colors.blueAccent), // Icon with color
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.blueAccent, width: 1.5), // Border color
            borderRadius:
                BorderRadius.circular(15), // Rounded corners for text fields
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.blue, width: 2), // Focused border color
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Colors.white, // Background color
          contentPadding: EdgeInsets.symmetric(
              vertical: 12, horizontal: 15), // Reduced padding
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
