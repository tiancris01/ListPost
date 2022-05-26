import 'package:flutter/material.dart';

import '../../Domain/usecases/post/post_usecase.dart';

class PostProvider extends ChangeNotifier {
  final PostUseCase postUsecase;

  PostProvider({required this.postUsecase});
}

/* class ZoneLocationProvider extends ChangeNotifier {
  final ZoneLocationUsecase zoneLocationUsecase;

  ZoneLocationProvider({required this.zoneLocationUsecase});
} */
