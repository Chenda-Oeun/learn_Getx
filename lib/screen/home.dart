import 'package:beginner/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userCon = Get.put(UserController());
  @override
  void initState() {
    _userCon. fetchUserData();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: Obx(()=> Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
            children: _userCon.userList.map((user)=> Card(
              child: ListTile(
                onTap: (){
                  print(user.firstName);
                },
                leading: const Icon(Icons.person),
                title: Text(user.firstName!,style: const TextStyle(fontSize: 18),),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            )).toList(),
          ),
        ),
      ),),
    );
  }
}
