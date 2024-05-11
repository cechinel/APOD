import 'package:flutter/material.dart';

class PicturesListSession extends StatelessWidget {
  final String sessionTitle;
  final String picture;
  final String pictureTitle;

  final String pictureDate;

  const PicturesListSession({
    super.key,
    required this.sessionTitle,
    required this.picture,
    required this.pictureTitle,
    required this.pictureDate,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
