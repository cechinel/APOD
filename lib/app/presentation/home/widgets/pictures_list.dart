import 'package:flutter/material.dart';

import '../../../../shared/format_date.dart';

class PicturesList extends StatelessWidget {
  final String picture;
  final String pictureTitle;
  final DateTime pictureDate;

  const PicturesList({
    super.key,
    required this.picture,
    required this.pictureTitle,
    required this.pictureDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: picture,
        child: SizedBox(
          width: 80,
          height: 50,
          child: ClipRect(
            child: Image.network(picture),
          ),
        ),
      ),
      title: Hero(
        tag: pictureTitle,
        child: Text(
          pictureTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.calendar_today, size: 12),
          const SizedBox(width: 4),
          Text(formatDate(pictureDate)),
        ],
      ),
    );
  }
}
