import 'package:flutter/material.dart';
import 'profile_email.dart';

class ProfileEmailLoginScreen extends StatefulWidget {
  final String username;
  final String email;
  final String phoneNo;
  final bool isAnonymous;
  final void Function(String) onUpdatePhone;

  ProfileEmailLoginScreen({
    required this.username,
    required this.email,
    required this.phoneNo,
    required this.isAnonymous,
    required this.onUpdatePhone,
  });

  @override
  _ProfileEmailLoginScreenState createState() =>
      _ProfileEmailLoginScreenState();
}

class _ProfileEmailLoginScreenState extends State<ProfileEmailLoginScreen> {
  late TextEditingController _phoneNoController;
  bool _isEditing = false;
  String _updatedPhoneNo = '';

  @override
  void initState() {
    super.initState();
    _phoneNoController = TextEditingController(text: widget.phoneNo);
    _updatedPhoneNo = widget.phoneNo;
  }

  @override
  void dispose() {
    _phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.username,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(height: 30, thickness: 1),
              ProfileEmail(
                email: widget.email,
                isEditingEmail: false,
                emailController: TextEditingController(text: widget.email),
                isAnonymous: widget.isAnonymous,
                emailUpdated: false,
                showEditIcon: false,
                showVerifyButton: false,
                onSendVerificationEmail: () {},
                onEditSavePressed: () {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(_isEditing ? Icons.close : Icons.edit),
                        onPressed: () {
                          setState(() => _isEditing = !_isEditing);
                        },
                      ),
                      if (_isEditing)
                        IconButton(
                          icon: const Icon(Icons.save),
                          onPressed: () {
                            setState(() {
                              widget.onUpdatePhone(_phoneNoController.text);
                              _updatedPhoneNo = _phoneNoController.text;
                              _isEditing = false;
                            });
                          },
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _isEditing
                  ? TextField(
                      controller: _phoneNoController,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  : Text(
                      _updatedPhoneNo.isNotEmpty
                          ? _updatedPhoneNo
                          : 'No phone number set',
                      style: const TextStyle(fontSize: 16),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
