import 'dart:convert';
import 'package:beginner/models/user_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController{
  

  // Variable 
  final userModels = Data().obs;
  final userList = <Data>[].obs;

  final isLoading = false.obs;

  // Methode

  Future<List<Data>> fetchUserData() async{
    isLoading(true);
    try{
      String url = "https://peopleinfoapi.herokuapp.com/api/person";

      await http.get(Uri.parse(url), headers: {
        "Accept" : "application/json",
        "Content-Type" : "application/json"
      }).then((response) {
        if(response.statusCode == 200){
          var responseJson = jsonDecode(response.body)["data"];
          userList.clear();
          responseJson.map((json){
            // userModels.value = Data.fromJson(json);
            userList.add(Data.fromJson(json));
          }).toList();

        }else{
            print("####################${response.statusCode}");
        }
      });

    }catch(e){
      // ignore: avoid_print
      print(e.toString());
    }finally{
      isLoading(false);
    }
    return userList;
  }
}