import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageSectionStackWidget extends StatelessWidget {
  final Object tag;
  final String imageUrl;
  final IconData? iconfav;
  final Color colorfav;
  final void Function()? onPressedback;
  final void Function()? onPressedfavorite;

  const ImageSectionStackWidget({
    super.key,
    required this.tag,
    required this.imageUrl,
    required this.onPressedback,
    required this.onPressedfavorite,
    required this.iconfav,
    required this.colorfav,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: tag,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: onPressedback,
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(iconfav, color: colorfav),
              onPressed: onPressedfavorite,
            ),
          ),
        ),
      ],
    );
  }
}
