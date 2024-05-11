import 'package:flutter/material.dart';

class PictureOfTheDaySession extends StatelessWidget {
  final String title;
  final String picture;
  final String pictureTitle;
  final bool loading;

  const PictureOfTheDaySession({
    super.key,
    required this.title,
    required this.picture,
    required this.pictureTitle,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
          _buildImageOfTheDay(),
        ],
      ),
    );
  }

  Widget _buildImageOfTheDay() {
    return SizedBox(
      width: 200,
      height: 200,
      child: ClipRect(
        child: Image.network(picture),
      ),
    );
  }
}
