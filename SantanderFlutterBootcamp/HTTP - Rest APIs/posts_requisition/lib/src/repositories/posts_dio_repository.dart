import 'package:dio/dio.dart';
import 'package:posts_requisition/src/models/post_model.dart';
import 'package:posts_requisition/src/repositories/custom_dio.dart';
import 'package:posts_requisition/src/repositories/interfaces/iposts_repository.dart';

class PostsDioRepository implements IPostsRepository {
  final CustomDio _dio = CustomDio();

  @override
  Future<List<PostModel>> getPosts() async {
    final Response response = await _dio.dio.get('/posts');
    
    if(response.statusCode == 200) {
      return (response.data as List).map((data) => PostModel.fromJson(data)).toList();
    }

    return List<PostModel>.empty();
  }
}
