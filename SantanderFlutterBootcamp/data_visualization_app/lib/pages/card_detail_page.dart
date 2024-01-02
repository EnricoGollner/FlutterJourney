import 'package:data_visualization_app/data/image_repository.dart';
import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final int tagIndex;

  const CardDetailPage({super.key, required this.tagIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Hero(
            tag: tagIndex,
            child: Image.asset(ImageRepository.getImagesPaths()[tagIndex]),
          ),
        ),
      ),
    );
  }
}
