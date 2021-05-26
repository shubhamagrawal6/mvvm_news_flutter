import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final imageUrl;

  const CircleImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return Container();
      },
    );
  }
}
