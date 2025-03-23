import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class ProfileImage extends StatefulWidget {
  final bool isAnonymous;
  final File? localImage;
  final VoidCallback? onTap;

  ProfileImage({required this.isAnonymous, this.localImage, this.onTap});

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? _imageUrl;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    setState(() {
      _isLoading = true;
    });
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (user.photoURL != null && user.photoURL!.isNotEmpty) {
        setState(() {
          _imageUrl = user.photoURL;
          _isLoading = false;
        });
      } else {
        setState(() {
          _imageUrl = null;
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: _isLoading
          ? CircularProgressIndicator()
          : CircleAvatar(
              radius: 60,
              backgroundImage: widget.localImage != null
                  ? FileImage(widget.localImage!) as ImageProvider<Object>?
                  : _imageUrl != null
                      ? NetworkImage(_imageUrl!) as ImageProvider<Object>?
                      : null,
              child: _imageUrl == null &&
                      widget.localImage == null &&
                      widget.isAnonymous
                  ? Icon(Icons.person)
                  : null,
            ),
    );
  }
}
