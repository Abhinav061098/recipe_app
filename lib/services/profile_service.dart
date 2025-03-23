import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> loadUserData() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        return doc.data() ?? {};
      }
    }
    return {};
  }

  Future<void> updateUserData(String newEmail, String phoneNo,
      {String? imageUrl}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      Map<String, dynamic> data = {
        'email': newEmail,
        'phoneNumber': phoneNo,
      };

      if (imageUrl != null) {
        data['imageUrl'] = imageUrl;
      }

      await _firestore.collection('users').doc(user.uid).set(
            data,
            SetOptions(merge: true),
          );
    }
  }
}
