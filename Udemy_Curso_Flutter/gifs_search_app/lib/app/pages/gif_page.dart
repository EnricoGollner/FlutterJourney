import 'package:flutter/material.dart';

import '../controller/share_controller.dart';
import '../data/models/gif_model.dart';

class GifPage extends StatelessWidget {
  const GifPage({super.key, required this.gifData});

  final GifModel gifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          gifData.title,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ShareController.shareGif(gifUrl: gifData.imageUrl);
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Center(
        child: Image.network(gifData.imageUrl),
      ),
    );
  }
}
