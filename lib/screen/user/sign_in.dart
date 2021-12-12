import 'package:beginner/controller/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final email = TextEditingController();
  final password = TextEditingController();
  final authCon = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: authCon.isSignInLoading.value ? const Center(child: CircularProgressIndicator(),) : Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 140, left: 20, right: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: email,
                        decoration:
                            const InputDecoration(hintText: "Enter email"),
                      ),
                      TextField(
                        controller: password,
                        decoration:
                            const InputDecoration(hintText: "Enter password"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                authCon.signInUser(email: email.text, password: password.text);
              },
              child: const Text("Login"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
