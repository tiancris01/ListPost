import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_test/Data/implementation/post/post_api.dart';
import 'package:zemoga_test/Domain/usecases/post/post_usecase.dart';

import 'package:zemoga_test/Presentation/pages/home_page.dart';
import 'Config/provider/providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (
            _,
          ) =>
              PostProvider(
            postUsecase: PostUseCase(
                PostApi(url: 'https://jsonplaceholder.typicode.com/posts')),
          ),
        ),
        /* ChangeNotifierProvider(
            create: (
          context,
        ) =>
                ZoneLocationProvider(
                  zoneLocationUsecase: ZoneLocationUsecase(
                    ZoneLocationApi(
                        urlstr: 'https://worldtimeapi.org/api/timezone'),
                  ),
                )) */
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}
