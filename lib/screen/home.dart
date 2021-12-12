import 'package:beginner/controller/firebase_auth.dart';
import 'package:beginner/screen/create_user.dart';
import 'package:beginner/screen/customer.dart';
import 'package:beginner/screen/user/sign_in.dart';
import 'package:beginner/screen/user/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authCon = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const Customer());
                    },
                    child: const Text("Customer"),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const CreateUser());
                    },
                    child: const Text("Create User"),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const SignUp());
                    },
                    child: const Text("Sign Up"),
                  ),
                ),
                 const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const SignIn());
                    },
                    child: const Text("Login"),
                  ),
                ),
                  const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      authCon.singOut();
                    },
                    child: const Text("Log out"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
