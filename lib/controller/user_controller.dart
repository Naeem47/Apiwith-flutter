import 'dart:convert';

import 'package:apifucntional/model/usermodel.dart';
import 'package:http/http.dart' as http;

getuser() async {
  var url = "https://maaz-api.tga-edu.com/api/users";
  var baseurl = Uri.parse(url);
  var response = await http.get(baseurl);
  var responsedata = jsonDecode(response.body);
  var userdata = UserModel.fromJson(responsedata);
  // print(userdata.data![0].name);
  return userdata;
}

createuser(data) async {
  const url = "https://maaz-api.tga-edu.com/api/users";
  var baseurl = Uri.parse(url);
  var response = await http.post(
    baseurl,
    body: jsonEncode(data),
    headers: {'content-type': 'application/json'},
  );
  print(response.body);
}


dltuser( id) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  Uri baseurl = Uri.parse(url);
  final response = await http.delete(baseurl);
  print(response);
}
