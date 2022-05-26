import 'package:http/http.dart' as http;

import '../../Domain/entities/post/post_model.dart';
import '../implementation/errors/location_api_errors.dart';

Future<List<PostModel>> httpRequestPost(String url) async {
  final Uri uri = Uri.parse(url);
  {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // print(response.body);
      final postModel = postModelFromJson(response.body);
      // print(location.datetime);
      return postModel;
    } else {
      throw LocationApiError();
    }
  }
}
