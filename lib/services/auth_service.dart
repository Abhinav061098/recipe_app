import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
          'uid': user.uid,
        });
        return user;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<User?> registerWithPhoneAndPassword(
      String phoneNumber, String password, String username) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: '$phoneNumber@phone.com',
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(username);

        await _firestore.collection('users').doc(user.uid).set({
          'username': username,
          'phoneNumber': phoneNumber,
          'uid': user.uid,
        });

        return user;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("FirebaseAuthException: ${e.message}");
      }
      throw e;
    } catch (e) {
      if (kDebugMode) {
        print("Exception: $e");
      }
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        if (!userDoc.exists) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName ?? 'Google User',
            'email': user.email,
            'uid': user.uid,
          });
        }
      }
      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<void> sendOtpToPhone(
      String phoneNumber,
      Function(PhoneAuthCredential) verificationCompleted,
      Function(FirebaseAuthException) verificationFailed,
      void Function(String, int?) codeSent,
      Function(String verificationId) codeAutoRetrievalTimeout) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<User?> signInWithPhone(String verificationId, String smsCode,
      String username, String phoneNumber) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': username,
          'phoneNumber': phoneNumber,
          'uid': user.uid,
        }, SetOptions(merge: true));
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("FirebaseAuthException: ${e.message}");
      }
      throw e;
    } catch (e) {
      if (kDebugMode) {
        print("Exception: $e");
      }
      throw e;
    }
  }

  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print("Error signing in anonymously: $e");
      }
      return null;
    }
  }

  Future<User?> signInWithPhoneAndPassword(
      String phoneNumber, String password) async {
    try {
      final email = '$phoneNumber@phone.com';
      final credential =
          EmailAuthProvider.credential(email: email, password: password);
      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Error signing in with phone and password: $e');
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('An unexpected error occurred during phone password login : $e');
      }
      return null;
    }
  }
}
