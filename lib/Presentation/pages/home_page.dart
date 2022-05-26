import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Config/provider/providers.dart';
import '../../Domain/entities/post/post_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final providerLocation = Provider.of<LocationProvider>(context);
    final providerPost = Provider.of<PostProvider>(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('LIST POST'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text('All'),
                ),
                Tab(
                  child: Text('Favorite'),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder<List<PostModel>>(
                  future: providerPost.postUsecase.getAllPost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            PostModel post = snapshot.data![index];
                            return Card(
                              color: Colors.blueGrey[100],
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      '${post.id}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                title: Text(post.title),
                                trailing: const Icon(Icons.star),
                              ),
                            );
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
                  }),
              FutureBuilder<List<PostModel>>(
                  future: providerPost.postUsecase.getAllPost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            PostModel post = snapshot.data![index];
                            return Card(
                              color: Colors.blueGrey[100],
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      '${post.id}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                title: Text(post.title),
                                trailing: const Icon(Icons.star),
                              ),
                            );
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
                  }),
            ],
          )),
    );

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
