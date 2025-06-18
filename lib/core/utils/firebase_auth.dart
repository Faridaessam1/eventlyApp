import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../models/user_data_model.dart';

class FirebaseFunctions {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create Account Function
  static Future<bool> createAccount(String email, String password, String name) async {
    try {
      EasyLoading.show();

      // Create user in Firebase Auth
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user document in Firestore
      UserModel newUser = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        eventIds: [],
      );

      await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(newUser.toMap());

      EasyLoading.dismiss();
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      // Handle different error codes
      String errorMessage = getAuthErrorMessage(e.code);
      EasyLoading.showError(errorMessage);
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Something went wrong");
      return false;
    }
  }

  // Login Function
  static Future<bool> login(String email, String password) async {
    try {
      EasyLoading.show();

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if user document exists, if not create it
      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) {
        // Create user document if it doesn't exist
        UserModel newUser = UserModel(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? "User",
          email: email,
          eventIds: [],
        );

        await firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(newUser.toMap());
      }

      EasyLoading.dismiss();
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      String errorMessage = getAuthErrorMessage(e.code);
      EasyLoading.showError(errorMessage);
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Something went wrong");
      return false;
    }
  }

  // Google Sign In
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      EasyLoading.show();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        EasyLoading.dismiss();
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await auth.signInWithCredential(credential);

      // Check if user document exists, if not create it
      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) {
        UserModel newUser = UserModel(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? "User",
          email: userCredential.user!.email ?? "",
          eventIds: [],
        );

        await firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(newUser.toMap());
      }

      EasyLoading.dismiss();
      return userCredential;
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Google Sign In failed");
      return null;
    }
  }

  // Get Current User Data
  static Future<UserModel?> getCurrentUserData() async {
    try {
      User? currentUser = auth.currentUser;
      if (currentUser == null) return null;

      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (userDoc.exists) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print("Error getting user data: $e");
      return null;
    }
  }

  // Update User Data
  static Future<bool> updateUserData(UserModel user) async {
    try {
      await firestore
          .collection('users')
          .doc(user.id)
          .update(user.toMap());
      return true;
    } catch (e) {
      print("Error updating user data: $e");
      return false;
    }
  }

  // Get Current User ID
  static String? getCurrentUserId() {
    return auth.currentUser?.uid;
  }

  // Sign Out
  static Future<void> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  // Helper function for error messages
  static String getAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'invalid-email':
        return 'The email address is not valid.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}