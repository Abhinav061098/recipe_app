import 'package:flutter/material.dart';
import 'dart:io';
import '../../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_image.dart';
import 'profile_dark_mode.dart';
import 'profile_logout_button.dart';
import 'profile_anonymous_message.dart';
import '../../services/profile_service.dart';
import '../../utils/image_utils.dart';
import 'profile_email_login_screen.dart';
import 'profile_phone_login_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileService _profileService = ProfileService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String username = 'Guest User';
  String email = '';
  String phoneNo = '';
  File? _localImage; // Store the locally uploaded image
  bool _darkMode = false;
  bool _isAnonymous = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  bool _emailUpdated = false;
  bool _isLoading = true;
  bool _isPhoneLogin = false;
  bool _phoneNoUpdated = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && !user.isAnonymous) {
      await _loadUserData();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadUserData() async {
    final userData = await _profileService.loadUserData();
    final user = _firebaseAuth.currentUser;
    if (mounted) {
      setState(() {
        _isAnonymous = user?.isAnonymous ?? true;
        username = userData['username'] ?? 'Guest User';
        email = userData['email'] ?? user?.email ?? '';
        phoneNo = userData['phoneNumber'] ?? '';
        _emailController.text = email;
        _phoneNoController.text = phoneNo;
        _isLoading = false;
        print('User Email (Phone Login Check): ${user?.email}');
        _isPhoneLogin = user?.email == null ||
            user?.email?.isEmpty == true ||
            (user?.email?.endsWith('@phone.com') ?? false);
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNoController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null && mounted) {
      setState(() {
        _localImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _updatePhone(String newPhone) async {
    await _profileService.updateUserData(email, newPhone);
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImage(
                localImage: _localImage, // Pass _localImage here
                isAnonymous: _isAnonymous,
                onTap: _pickImage,
              ),
              const SizedBox(height: 20),
              if (_isPhoneLogin)
                ProfilePhoneLoginScreen(
                  username: username,
                  phoneNo: phoneNo,
                )
              else
                ProfileEmailLoginScreen(
                  username: username,
                  email: email,
                  phoneNo: phoneNo,
                  isAnonymous: _isAnonymous,
                  onUpdatePhone: _updatePhone,
                ),
              const SizedBox(height: 20),
              ProfileDarkMode(
                darkMode: _darkMode,
                onDarkModeChanged: (value) {
                  setState(() {
                    _darkMode = value;
                    if (_darkMode) {
                      themeModeNotifier.value = ThemeMode.dark;
                    } else {
                      themeModeNotifier.value = ThemeMode.light;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              ProfileLogoutButton(isAnonymous: _isAnonymous),
              if (_isAnonymous) ProfileAnonymousMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
