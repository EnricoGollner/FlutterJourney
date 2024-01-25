import 'dart:convert';

import 'package:posts_requisition/src/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:posts_requisition/src/repositories/interfaces/iposts_repository.dart';

class PostsHttpRepository implements IPostsRepository {
  
  @override
  Future<List<PostModel>> getPosts() async {
    http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((post) => PostModel.fromJson(post)).toList();
    }
    
    return List<PostModel>.empty();
  }
}