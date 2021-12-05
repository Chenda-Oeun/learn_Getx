import 'package:beginner/controller/user_controller.dart';
import 'package:beginner/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _userCon = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final latNameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => _userCon.isSubmitLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _formKey,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.purple[100]!, Colors.blue[100]!],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK5tNODWzky-TsDAK07BboehsDHNWl9MP9qA&usqp=CAU"),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Please input information to create user.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 30),
                                    TextFormField(
                                      controller: firstNameController,
                                      decoration: const InputDecoration(
                                        hintText: "First name",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please input firstname";
                                        }
                                        if (value.contains(" ")) {
                                          return "First name cannot contain white space";
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: latNameController,
                                      decoration: const InputDecoration(
                                        hintText: "Last name",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please input lastname";
                                        }
                                        if (value.contains(" ")) {
                                          return "Last name cannot contain white space";
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: ageController,
                                      decoration: const InputDecoration(
                                        hintText: "Age",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please input your age";
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _userCon.creatUser(
                                    firstname: firstNameController.text,
                                    lastname: latNameController.text,
                                    age: ageController.text,
                                  );
                                }
                              },
                              child: const Text("Submit"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
