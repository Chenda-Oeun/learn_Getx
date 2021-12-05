import 'package:beginner/controller/user_controller.dart';
import 'package:beginner/helper/app_defualt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  final _userCon = Get.put(UserController());
  @override
  void initState() {
    _userCon.fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Obx(
          () => _userCon.isLoading.value == true
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: padding, vertical: padding),
                    child: Column(
                      children: _userCon.userList
                          .map((user) => Card(
                                child: ListTile(
                                  onTap: () {
                                    print(user.firstName);
                                  },
                                  leading: const Icon(Icons.person),
                                  title: Text(
                                  "${user.firstName!} ${user.lastName!}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
              ),
        ),
      ),
    );
  }
}
