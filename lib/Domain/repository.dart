import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Data/User_model.dart';
import '../Data/post_model.dart';

const String urlPost = "https://jsonplaceholder.typicode.com/posts";
const String urlUser = "https://jsonplaceholder.typicode.com/users";
/* List<Post> parsePost(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var posts = list.map((e) => Post.fromJson(e)).toList();
  return posts;
} */

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

Future<List<Post>> fetchPosts() async {
  final http.Response response = await http.get(Uri.parse(urlPost));

  if (response.statusCode == 200) {
    return compute(postFromJson, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}

/* User userFromJson(String str) => User.fromJson(json.decode(str));

Future<User> fetchUser(int index) async {
  String urlUser = "https://jsonplaceholder.typicode.com/users/$index";
  final http.Response response = await http.get(Uri.parse(urlUser));
  if (response.statusCode == 200) {
    return compute(userFromJson, response.body);
    /* final user = userFromJson(response.body);
    return user; */
  } else {
    throw Exception(response.statusCode);
  }
} */

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

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
