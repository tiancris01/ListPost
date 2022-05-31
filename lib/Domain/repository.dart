import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Data/User_model.dart';
import '../Data/post_model.dart';

const String urlPost = "https://jsonplaceholder.typicode.com/posts";
const String urlUser = "https://jsonplaceholder.typicode.com/users";

// Fetch Post data from JsonPlaceHolder
Future<List<Post>> fetchPosts() async {
  final http.Response response = await http.get(Uri.parse(urlPost));

  if (response.statusCode == 200) {
    return compute(postFromJson, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}

//Return a Post list
List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// Fetch User data from JsonPlaceHolder
Future<List<User>> fetchUser() async {
  final http.Response response = await http.get(Uri.parse(urlUser));

  if (response.statusCode == 200) {
    return compute(userFromJson, response.body);
    /* final user = userFromJson2(response.body);
    return user; */
  } else {
    throw Exception(response.statusCode);
  }
}

//Return a User list
List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
