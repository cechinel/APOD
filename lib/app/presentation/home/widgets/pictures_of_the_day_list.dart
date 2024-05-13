import 'dart:async';

import 'package:apod/app/presentation/home/widgets/pictures_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../../../../module/app_routes.dart';
import '../../../domain/models/apod_dto.dart';
import '../home_page_controller.dart';

class PicturesOfTheDayList extends StatefulWidget {
  const PicturesOfTheDayList({super.key});

  @override
  State<PicturesOfTheDayList> createState() => _PicturesOfTheDayListState();
}

class _PicturesOfTheDayListState extends State<PicturesOfTheDayList> {
  final _controller = Modular.get<HomePageController>();
  final _swipeController = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _swipeController.stream;

  Future<void> _refresh() async {
    _controller.getAstronomyPicturesOfTheDay().then((value) {
      _swipeController.sink.add(SwipeRefreshState.hidden);
    });
  }

  @override
  void dispose() {
    _swipeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final List<ApodDto> displayedPictures =
          _controller.searchResults.isNotEmpty
              ? _controller.searchResults
              : _controller.picturesOfTheDayList;

      return Expanded(
        child: SwipeRefresh.builder(
          itemCount: displayedPictures.length,
          stateStream: _stream,
          onRefresh: _refresh,
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
      );
    });
  }
}
