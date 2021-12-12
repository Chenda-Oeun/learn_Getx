import 'package:beginner/screen/home.dart';
import 'package:beginner/screen/user/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  // FirebaseAuth auth = FirebaseAuth.instance;
  final isCreateLouding = false.obs;
  final isSignInLoading = false.obs;

  onCheckUser() {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      Get.offAll(() => const SignIn());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  Future<void> createUser({String? email, String? password}) async {
    isCreateLouding(true);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        if (value.credential.hashCode == 2011) {
          print("dsdsdsd${value.credential.hashCode}");
          Get.offAll(() => const SignIn());
        }
      });
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    isCreateLouding(false);
  }

  Future<void> signInUser({String? email, String? password}) async {
    isSignInLoading(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        if (value.credential.hashCode == 2011) {
          Get.offAll(() => const HomePage());
        }
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    isSignInLoading(false);
  }

  singOut() async {
    final auth = FirebaseAuth.instance;
    await auth.signOut().then((value) => Get.offAll(() => const SignIn()));
  }
}
