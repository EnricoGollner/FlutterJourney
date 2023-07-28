import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: Image.network(gifData.imageUrl),
      ),
    );
  }
}
