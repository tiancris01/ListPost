import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String titleTxt;
  const CustomTitle({Key? key, required this.titleTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(titleTxt,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.blue,
          )),
    );
  }
}
