import '../../entities/post/post_model.dart';
import '../../repositories/post/post_repo.dart';

class PostUseCase {
  final PostRepo _postRepo;
  PostUseCase(this._postRepo);

  Future<List<PostModel>> getAllPost() {
    return _postRepo.getAllPost();
  }
}
