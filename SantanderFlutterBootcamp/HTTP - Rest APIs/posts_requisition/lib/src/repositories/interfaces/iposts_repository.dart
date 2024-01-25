import 'package:posts_requisition/src/models/post_model.dart';

abstract class IPostsRepository {
  Future<List<PostModel>> getPosts();
}