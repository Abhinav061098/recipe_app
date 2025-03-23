import 'package:flutter/material.dart';
import 'package:soopfood/screens/login_screen/login_screen.dart';
import 'package:soopfood/widgets/loading_widget.dart';
import 'package:soopfood/widgets/register_widget/email_register_form.dart';
import 'package:soopfood/widgets/register_widget/phone_register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;
  String _emailError = '';
  String _phoneError = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_clearErrors);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _clearErrors() {
    setState(() {
      _emailError = '';
      _phoneError = '';
    });
  }

  void _setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  void _setEmailError(String error) {
    setState(() {
      _emailError = error;
    });
  }

  void _setPhoneError(String error) {
    setState(() {
      _phoneError = error;
    });
  }

  void _setError(String error) {
    if (_tabController.index == 0) {
      _setEmailError(error);
    } else {
      _setPhoneError(error);
    }
  }

  // New callback for handling registration success
  void _handleRegistrationSuccess(String message) {
    // Display SnackBar in the parent context
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: DefaultTextStyle(
          style: TextStyle(color: Colors.white), // Set text color to white
          child: Text(message),
        ),
        backgroundColor: Colors.green, // Set background color to green
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginScreen()), // Replace LoginScreen with your login screen widget
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _isLoading
          ? LoadingWidget()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTitle(),
                    SizedBox(height: 20),
                    _buildTabBar(),
                    SizedBox(height: 20),
                    SizedBox(
                      // use a container with a defined height
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: _buildTabBarView(),
                    ),
                    _buildErrorDisplay(),
                    _buildAlreadyHaveAccountText(),
                  ],
                ),
              ),
            ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Signup'),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      elevation: 8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'Create an Account',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Choose a method to register',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(text: 'Email'),
        Tab(text: 'Phone'),
      ],
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      indicatorColor: Colors.blue,
      indicatorWeight: 3,
    );
  }

  Widget _buildTabBarView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          // Pass the success callback to the EmailRegisterForm
          EmailRegisterForm(
            setLoading: _setLoading,
            setError: _setError,
            onRegistrationSuccess:
                _handleRegistrationSuccess, // Pass the success callback
          ),
          PhoneRegisterForm(
            setLoading: _setLoading,
            setError: _setError,
            onRegistrationSuccess: _handleRegistrationSuccess,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorDisplay() {
    if (_tabController.index == 0 && _emailError.isNotEmpty) {
      return Container(
        height: 80, // Increase height to accommodate longer messages
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Center(
            child: Text(
              _emailError,
              style: TextStyle(color: Colors.red),
              overflow: TextOverflow.visible, // Prevent cropping
            ),
          ),
        ),
      );
    } else if (_tabController.index == 1 && _phoneError.isNotEmpty) {
      return Container(
        height: 80,
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              _phoneError,
              style: TextStyle(color: Colors.red),
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  // New Widget to add "Already have an account?" section
  Widget _buildAlreadyHaveAccountText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent, // Login text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
