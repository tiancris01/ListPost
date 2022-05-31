import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String textTxt;
  const CustomText({Key? key, required this.textTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(textTxt,
          softWrap: false,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            wordSpacing: 0.2,
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Color.fromARGB(255, 89, 92, 94),
          )),
    );
  }
}
