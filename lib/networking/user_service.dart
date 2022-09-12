import 'dart:convert';
import 'package:chapter11/model/User.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class UserService {
  var payload = {
    "name": "",
    "collection": [
      {"recipe": "Pasta"},
      {"recipe": "Pizza"}
    ]
  };

  static const String apiKey = 'eba0e548fc5c621407583cc4387ce540';
  static const String apiId = 'ea86d1c0';
  static const String apiUrl = 'http://localhost:3000/api/productType';
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  static var api_response;
  final storage = const FlutterSecureStorage();
  late Map<String, dynamic> userMap;

  // USER SIGN UP :

  static Future getData(String url) async {
    print('Calling url: $url');
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      // 5
      print("ss$response");
      return response.body;
    } else {
      // 6
      print(response.statusCode);
    }
    var zz = json.decode(response.body);
    print("ss$zz");
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    // 2
    final recipeData = await getData(
        "$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to");
    print("ss$recipeData");
    // 3
    return recipeData;
  }

  Future fetchSettings(String uri) async {
    final response = await http.get(
      Uri.parse(uri),
    );
    if (response.statusCode == 200) {
      api_response = json.decode(response.body);
      var zz = User.fromJson(api_response[0]);
      print("$zz");
      return api_response;
    } else {
      print(response.statusCode);
    }
  }
}
