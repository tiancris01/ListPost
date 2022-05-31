import 'package:flutter/material.dart';

import 'Presentation/screens/post_page.dart';

// This is the main, the roof of the App
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to Flutter',
      home: Posts(),
    );
  }
}
