import 'package:beginner/controller/user_controller.dart';
import 'package:beginner/screen/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          padding: const EdgeInsets.all(20),
          color: Colors.yellowAccent[50],
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Please Enter email and password",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
                onChanged: (value) {
                  userController.email.value = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text("User name"),
                ),
                onChanged: (value) {
                  userController.name.value = value;
                },
              ),
              const SizedBox(height: 30),
              Text(userController.name.value),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const DetailsPage());
                    }, child: const Text("Click Me")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
