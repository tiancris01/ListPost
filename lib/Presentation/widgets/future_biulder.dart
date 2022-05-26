import 'package:flutter/material.dart';

class FutureConstuctor extends StatelessWidget {
  const FutureConstuctor({Key? key, required this.futureProvider})
      : super(key: key);
  final Future futureProvider;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: futureProvider,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              '${snapshot.data}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            );
          } else if (snapshot.hasError) {
            return Text('$snapshot.hasError');
          }
          return const Center(
            child: SizedBox(
              width: 20,
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
