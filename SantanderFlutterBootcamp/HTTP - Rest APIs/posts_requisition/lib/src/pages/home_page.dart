import 'package:flutter/material.dart';
import 'package:posts_requisition/src/models/post_model.dart';
import 'package:posts_requisition/src/pages/widgets/card_post.dart';
import 'package:posts_requisition/src/repositories/interfaces/iposts_repository.dart';
import 'package:posts_requisition/src/repositories/posts_dio_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IPostsRepository _postsRepository;
  List<PostModel> _posts = List<PostModel>.empty();

  @override
  void initState() {
    _postsRepository = PostsDioRepository();

    WidgetsBinding.instance.addPostFrameCallback((_) async => await _loadPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts Coments'), centerTitle: true,),
      body: _posts.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return CardPost(
                  title: _posts[index].title,
                  body: _posts[index].body,
                );
              },
            ),
    );
  }

  Future<void> _loadPosts() async {
    _posts = await _postsRepository.getPosts();
    setState((){});
  }
}
