import '../../entities/post/post_model.dart';

abstract class PostRepo {
  Future<List<PostModel>> getAllPost();
}
