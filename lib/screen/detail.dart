import 'package:beginner/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {

  const DetailsPage({ Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         
          ],
        ),
      ),
    );
  }
}