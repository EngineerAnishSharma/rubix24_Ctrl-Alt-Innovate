import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rubix_application/consts/firebase_const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //login method ? means return type can be null
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //Signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // Google sign in
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return null;
  //   // Trigger the authentication flow
  // }

// ...

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Access the user information
      User user = userCredential.user!;
      String? email = user.email;
      String username = extractUsername(email!);
      String password = generateRandomPassword(8);
      // Store the username using SharedPreferences
      storeUsername(username);

      storeUserData(name: username, email: email, password: password);
      // Your additional logic here...

      return userCredential;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  String extractUsername(String emailAddress) {
    int atIndex = -1;
    atIndex = emailAddress.indexOf('@');

    if (atIndex != -1) {
      return emailAddress.substring(0, atIndex);
    } else {
      return emailAddress;
    }
  }

  String generateRandomPassword(int length) {
    const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    const String numericChars = '0123456789';
    const String specialChars = r'!@#$%^&*()-_=+[]{}|;:,.<>?';

    String allChars =
        uppercaseChars + lowercaseChars + numericChars + specialChars;

    Random random = Random();
    StringBuffer password = StringBuffer();

    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(allChars.length);
      password.write(allChars[randomIndex]);
    }

    return password.toString();
  }

  void storeUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  //Storing data
  storeUserData({name, password, email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', name);
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'id': currentUser!.uid,
      'language': "",
      'age': "",
      'level': "",
      'journey': "",
      'daily_target': "",
      'record': ""
    });
  }

  //signout method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
