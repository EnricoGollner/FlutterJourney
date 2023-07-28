import 'package:flutter/material.dart';
import 'package:gifs_search_app/app/controller/share_controller.dart';
import 'package:transparent_image/transparent_image.dart';

import '../data/models/gif_model.dart';
import '../pages/gif_page.dart';

class GifContainer extends StatelessWidget {
  const GifContainer({
    super.key,
    required this.gifData,
  });

  final GifModel gifData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GifPage(gifData: gifData),
          ),
        );
      },
      onLongPress: () {
        ShareController.shareGif(gifUrl: gifData.imageUrl);
      },
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: gifData.imageUrl,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
