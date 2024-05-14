import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/format_date.dart';

class PicturesList extends StatelessWidget {
  final String picture;
  final String pictureTitle;
  final DateTime pictureDate;
  final Function()? onTap;

  const PicturesList({
    super.key,
    this.onTap,
    required this.picture,
    required this.pictureTitle,
    required this.pictureDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('pictures_list'),
      leading: Hero(
        tag: picture,
        child: SizedBox(
          width: 70,
          height: 70,
          child: CachedNetworkImage(
            imageUrl: picture,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
      onTap: onTap,
    );
  }
}
