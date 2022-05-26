import '../../../Domain/entities/post/post_model.dart';
import '../../../Domain/repositories/post/post_repo.dart';
import '../../helpers/http_request.dart';

class PostApi extends PostRepo {
  late String url;
  PostApi({required this.url});

  @override
  Future<List<PostModel>> getAllPost() async {
    return await httpRequestPost(url);
  }
}
