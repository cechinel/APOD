import 'package:flutter/material.dart';

class PictureOfTheDaySession extends StatelessWidget {
  final String title;
  final String picture;
  final String pictureTitle;

  const PictureOfTheDaySession({
    super.key,
    required this.title,
    required this.picture,
    required this.pictureTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              pictureTitle,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
