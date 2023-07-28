import 'package:flutter/material.dart';

import '../data/models/gif_model.dart';
import '../pages/gif_page.dart';

class GifContainer extends StatelessWidget {
  const GifContainer({
    super.key,
    required this.gif,
  });

  final GifModel gif;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.network(
        gif.imageUrl,
        height: 300.0,
        fit: BoxFit.cover,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GifPage(gifData: gif),
          ),
        );
      },
    );
  }
}
