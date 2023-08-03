// // ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<UserModel>?> getUser() async {
    List<UserModel> userModelList = [];
    String query = "?q=Paris&days=5";
    final response =
        await http.get(Uri.parse("http://192.168.1.65:3000/data/$query"), headers: {
      'key': "your api key",

    });
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      log(decodedData.runtimeType.toString());
      log(decodedData.toString());
      if (decodedData.runtimeType.toString() == "List<dynamic>") {
        for (var element in decodedData) {
          userModelList.add(UserModel.fromJson(element));
        }
      }
      return userModelList;
    } else {
      log("Error in showing data");
    }
    return null;
  }

  Future<bool> postUserData(UserModel userModel) async {
    log(userModel.toJson().toString());

    final response = await http.post(
      Uri.parse("http://192.168.1.65:3000/data/"),
      body: userModel.toJson(),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      log(response.body.toString());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> editUserData(UserModel userModel) async {
    log(userModel.toJson().toString());

    final response = await http.put(
      Uri.parse("http://192.168.1.65:3000/data/${userModel.id}"),
      body: userModel.toJson(),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      log(response.body.toString());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteUserData(UserModel userModel) async {
    log(userModel.toJson().toString());

    final response = await http.delete(
      Uri.parse("http://192.168.1.65:3000/data/${userModel.id}"),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      log(response.body.toString());
      return true;
    } else {
      return false;
    }
  }
}

class UserModel {
  final int? id;
  final String name;
  final String position;

  UserModel({
    this.id,
    required this.name,
    required this.position,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() => {
        // "id": id,
        "name": name,
        "position": position,
      };
}
