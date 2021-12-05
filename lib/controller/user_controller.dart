import 'dart:convert';
import 'package:beginner/models/user_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  // Variable
  final userModels = Data().obs;
  final userList = <Data>[].obs;
  final isLoading = false.obs;
  // Methode

  Future<List<Data>> fetchUserData() async {
    isLoading(true);
    try {
      String url = "https://peopleinfoapi.herokuapp.com/api/person"; // Route

      await http.get(Uri.parse(url), headers: {
        // Request to API
        "Accept": "application/json",
        "Content-Type": "application/json"
      }).then((response) {
        if (response.statusCode == 200) {
          // Check status code
          var responseJson =
              jsonDecode(response.body)["data"]; //Get only data key in body
          userList.clear();
          responseJson.map((json) {
            userModels.value = Data.fromJson(
                json); // Convert from json and parst to dart model
            userList.add(userModels.value); // Add user model to user list
          }).toList();
        } else {
          // ignore: avoid_print
          print(
              "################${response.statusCode}"); // check status code if failed
        }
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString()); // print error
    } finally {
      isLoading(false); // Stop loading
    }
    return userList; // return user list
  }

  final isSubmitLoading = false.obs;
  Future<void> creatUser(
      {String? firstname, String? lastname, String? age}) async {
    isSubmitLoading(true);
    try {
      String url = "https://peopleinfoapi.herokuapp.com/api/person";
      await http.post(Uri.parse(url), body: {
        "first_name": firstname,
        "last_name": lastname,
        "age": age,
        "active_date": "03/12/21"
      }).then((response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.snackbar(
            "Success",
            "Dear $firstname, you have been submitted successfully"
            );
        } else {
            Get.snackbar(
            "Sumitted Failed",
            "You have submitted failed."
            );
        }
      });
    } catch (e) {
      print(e.toString());
    } finally {
      isSubmitLoading(false);
    }
  }
}
