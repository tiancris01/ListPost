import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_test/Domain/entities/post/post_model.dart';
import 'package:zemoga_test/Domain/usecases/post/post_usecase.dart';

import '../../Config/provider/providers.dart';
import '../widgets/future_biulder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final providerLocation = Provider.of<LocationProvider>(context);
    final providerPost = Provider.of<PostProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('User App Clean Arquitecture')),
        body: FutureBuilder<List<PostModel>>(
            future: providerPost.postUsecase.getAllPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      PostModel post = snapshot.data![index];
                      return Text(post.title);
                    }));
              } else if (snapshot.hasError) {
                return Text('$snapshot.hasError');
              }
              return const Center(
                child: SizedBox(
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
              );
            }));

    /* FutureBuilder<Location>(
            future: providerLocation.locationUsecase.getAllLocations(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  '${snapshot.data!.datetime}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
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
            })); */
  }
}
