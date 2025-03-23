import 'package:flutter/material.dart';
import 'package:soopfood/widgets/login_widget/login_header.dart';
import 'package:soopfood/widgets/login_widget/email_login_form.dart';
import 'package:soopfood/widgets/login_widget/phone_login_form.dart';
import 'package:soopfood/widgets/login_widget/alternative_login_options.dart';
import '../../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();
  String error = '';
  bool _isLoading = false;
  late TabController _tabController;
  String email = '';
  String phoneNumber = '';
  final GlobalKey<FormState> _emailFormKey =
      GlobalKey<FormState>(); // Moved key here

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          error = '';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                LoginHeader(),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Email Login'),
                      Tab(text: 'Phone Login'),
                    ],
                    labelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      EmailLoginForm(
                        formKey: _emailFormKey,
                        onLogin: (email, password) async {
                          setState(() => _isLoading = true);
                          try {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Incorrect email or password.';
                                _isLoading = false;
                              });
                            } else {
                              // Check if the widget is still mounted before navigating
                              if (mounted) {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              }
                            }
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              error = e.message ?? 'An error occurred.';
                              _isLoading = false;
                            });
                          }
                        },
                        onUpdateEmail: (val) => setState(() => email = val),
                        onUpdatePassword: (val) {},
                      ),
                      PhoneLoginForm(
                        setLoading: (bool loading) =>
                            setState(() => _isLoading = loading),
                        setError: (String errorMessage) =>
                            setState(() => error = errorMessage),
                        onLoginSuccess: (String message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                AlternativeLoginOptions(
                  onGoogleSignIn: () async {
                    setState(() => _isLoading = true);
                    dynamic result = await _auth.signInWithGoogle();
                    if (result == null) {
                      setState(() {
                        error = 'Could not sign in with Google';
                        _isLoading = false;
                      });
                    } else {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  onGuestSignIn: () async {
                    setState(() => _isLoading = true);
                    User? user = await _auth.signInAnonymously();
                    if (user != null) {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      setState(() {
                        error = 'Guest login failed.';
                        _isLoading = false;
                      });
                    }
                  },
                ),
                if (error.isNotEmpty)
                  Text(error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0)),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.white.withOpacity(0.8),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
