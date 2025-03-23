// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import '../services/auth_service.dart';
// import '../screens/login_screen/login_screen.dart';
// import 'package:soopfood/main.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final AuthService _auth = AuthService();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   String username = 'Guest User';
//   String email = '';
//   String phoneNo = '';
//   File? _profileImage;
//   bool _darkMode = false;
//   bool _isAnonymous = true;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneNoController = TextEditingController();
//   bool _isEditingEmail = false;
//   bool _isEditingPhoneNo = false;
//   bool _verificationEmailSent = false;
//   bool _emailUpdated = false;

//   void _loadUserData() async {
//     User? user = _firebaseAuth.currentUser;
//     if (user != null) {
//       if (mounted) {
//         setState(() {
//           _isAnonymous = user.isAnonymous;
//         });
//       }
//       if (!user.isAnonymous) {
//         if (mounted) {
//           String? userEmail = user.email;
//           if (userEmail != null && !userEmail.endsWith('@gmail.com')) {
//             email = 'Update Email';
//             _emailController.text = '';
//           } else {
//             email = userEmail ?? '';
//             _emailController.text = email;
//           }
//           setState(() {});
//         }
//         try {
//           DocumentSnapshot userDoc =
//               await _firestore.collection('users').doc(user.uid).get();
//           if (userDoc.exists) {
//             if (mounted) {
//               setState(() {
//                 username = userDoc['username'] ?? 'No username';
//                 phoneNo = userDoc['phoneNumber'] ?? '';
//                 _phoneNoController.text = phoneNo;
//               });
//             }
//           }
//         } catch (e) {
//           if (mounted) {
//             setState(() {
//               username = 'Error loading user data';
//               phoneNo = 'Error loading user data';
//             });
//           }
//         }
//       } else {
//         if (mounted) {
//           setState(() {
//             username = 'Guest User';
//             email = '';
//             phoneNo = '';
//             _profileImage = null;
//             _emailController.text = '';
//             _phoneNoController.text = '';
//           });
//         }
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _phoneNoController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     if (!_isAnonymous) {
//       final pickedFile =
//           await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           _profileImage = File(pickedFile.path);
//         });
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please log in to change your profile picture.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }

//   Future<void> _updateUserData() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       try {
//         String updatedEmail = _emailController.text.trim();
//         String updatedPhone = _phoneNoController.text.trim();

//         if (_isEditingEmail && updatedEmail != email) {
//           try {
//             await user.verifyBeforeUpdateEmail(updatedEmail);
//             await FirebaseFirestore.instance
//                 .collection('users')
//                 .doc(user.uid)
//                 .update({'email': updatedEmail});

//             setState(() {
//               email = updatedEmail;
//               _isEditingEmail = false;
//               _verificationEmailSent = true;
//               _emailUpdated = true;
//             });

//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text(
//                     'Verification email sent. Please verify before email change.'),
//                 duration: Duration(seconds: 5),
//               ),
//             );
//           } on FirebaseAuthException catch (e) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Error updating email: ${e.message}'),
//                 duration: const Duration(seconds: 5),
//               ),
//             );
//           } catch (e) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Error updating email: $e'),
//                 duration: const Duration(seconds: 5),
//               ),
//             );
//           }
//         }

//         if (_isEditingPhoneNo && updatedPhone != phoneNo) {
//           await _firestore
//               .collection('users')
//               .doc(user.uid)
//               .update({'phoneNumber': updatedPhone});
//           setState(() {
//             phoneNo = updatedPhone;
//             _isEditingPhoneNo = false;
//           });
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Phone number updated successfully!'),
//               duration: Duration(seconds: 3),
//             ),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error updating profile: $e'),
//             duration: const Duration(seconds: 3),
//           ),
//         );
//       }
//     }
//   }

//   void _sendVerificationEmail() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null && email != 'Update Email') {
//       try {
//         await user.verifyBeforeUpdateEmail(email);
//         setState(() {
//           _verificationEmailSent = true;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Verification email sent.'),
//             duration: Duration(seconds: 5),
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error sending verification email: ${e.message}'),
//             duration: const Duration(seconds: 5),
//           ),
//         );
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error sending verification email: $e'),
//             duration: const Duration(seconds: 5),
//           ),
//         );
//       }
//     }
//   }

//   void _checkEmailVerification() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       await user.reload();
//       if (user.emailVerified && mounted) {
//         setState(() {
//           _isEditingEmail = false;
//           _verificationEmailSent = false;
//           _emailUpdated = false;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Email verified successfully!'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: CircleAvatar(
//                   radius: 60,
//                   backgroundColor: Colors.deepOrangeAccent,
//                   child: CircleAvatar(
//                     radius: 55,
//                     backgroundImage: _isAnonymous
//                         ? const NetworkImage('https://via.placeholder.com/150')
//                         : _profileImage == null
//                             ? const NetworkImage(
//                                 'https://via.placeholder.com/150')
//                             : FileImage(_profileImage!) as ImageProvider,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 username,
//                 style:
//                     const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _isEditingEmail
//                         ? TextField(
//                             controller: _emailController,
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: const InputDecoration(
//                               labelText: 'Email',
//                               border: OutlineInputBorder(),
//                             ),
//                           )
//                         : Text(
//                             email.isNotEmpty ? email : 'Update Email',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: email == 'Update Email'
//                                     ? Colors.grey
//                                     : Colors.grey.shade600),
//                           ),
//                   ),
//                   if (!_isAnonymous)
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         if (_emailUpdated &&
//                             !FirebaseAuth.instance.currentUser!.emailVerified)
//                           IconButton(
//                             onPressed: _sendVerificationEmail,
//                             icon: const Icon(Icons.warning),
//                           ),
//                         IconButton(
//                           onPressed: () {
//                             if (_isEditingEmail) {
//                               _updateUserData();
//                             } else {
//                               _checkEmailVerification();
//                             }
//                             setState(() {
//                               _isEditingEmail = !_isEditingEmail;
//                             });
//                           },
//                           icon: Icon(_isEditingEmail
//                               ? Icons.save
//                               : email.isNotEmpty
//                                   ? Icons.edit
//                                   : Icons.add),
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _isEditingPhoneNo
//                         ? TextField(
//                             controller: _phoneNoController,
//                             keyboardType: TextInputType.phone,
//                             decoration: const InputDecoration(
//                               labelText: 'Phone Number',
//                               border: OutlineInputBorder(),
//                             ),
//                           )
//                         : Text(
//                             phoneNo.isNotEmpty ? phoneNo : 'No Phone Number',
//                             style: TextStyle(
//                                 fontSize: 16, color: Colors.grey.shade600),
//                           ),
//                   ),
//                   if (!_isAnonymous)
//                     IconButton(
//                       onPressed: () {
//                         if (_isEditingPhoneNo) {
//                           _updateUserData();
//                         }
//                         setState(() {
//                           _isEditingPhoneNo = !_isEditingPhoneNo;
//                         });
//                       },
//                       icon: Icon(_isEditingPhoneNo
//                           ? Icons.save
//                           : phoneNo.isNotEmpty
//                               ? Icons.edit
//                               : Icons.add),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.deepOrangeAccent.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text('Dark Mode',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w500)),
//                     Switch(
//                       value: _darkMode,
//                       activeColor: Colors.deepOrangeAccent,
//                       onChanged: (value) {
//                         setState(() {
//                           _darkMode = value;
//                           if (_darkMode) {
//                             themeModeNotifier.value = ThemeMode.dark;
//                           } else {
//                             themeModeNotifier.value = ThemeMode.light;
//                           }
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (_isAnonymous) {
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => LoginScreen(),
//                         ),
//                       );
//                     } else {
//                       await _auth.signOut();
//                       if (context.mounted) {
//                         themeModeNotifier.value = ThemeMode.light;
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                             builder: (context) => LoginScreen(),
//                           ),
//                         );
//                       }
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepOrangeAccent,
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     _isAnonymous ? 'Login' : 'Logout',
//                     style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//               if (_isAnonymous) ...[
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Login to access more features and personalize your profile.",
//                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
