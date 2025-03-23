import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

Future<File?> pickImage(BuildContext context, bool isAnonymous) async {
  if (!isAnonymous) {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please log in to change your profile picture.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
  return null;
}
