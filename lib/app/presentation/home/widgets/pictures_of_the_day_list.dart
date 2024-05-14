import 'package:apod/app/presentation/home/widgets/pictures_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../module/app_routes.dart';
import '../../../domain/models/apod_dto.dart';
import '../home_page_controller.dart';

class PicturesOfTheDayList extends StatelessWidget {
  const PicturesOfTheDayList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomePageController>();

    return Observer(builder: (context) {
      final List<ApodDto> displayedPictures =
          controller.searchResults.isNotEmpty
              ? controller.searchResults
              : controller.picturesOfTheDayList;

      return Expanded(
        child: RefreshIndicator(
          onRefresh: controller.getAstronomyPicturesOfTheDay,
          child: ListView.builder(
            itemCount: displayedPictures.length,
            itemBuilder: (context, index) {
              final pictureOfTheDay = displayedPictures[index];

              return PicturesList(
                picture: pictureOfTheDay.url,
                pictureTitle: pictureOfTheDay.title,
                pictureDate: pictureOfTheDay.date,
                onTap: () => AppRoutes.goToDetailPage(pictureOfTheDay),
              );
            },
          ),
        ),
      );
    });
  }
}
