import 'dart:async';

import 'package:apod/app/presentation/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../../domain/models/apod_dto.dart';
import 'widgets/pictures_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomePageController>();
  final _swipeController = StreamController<SwipeRefreshState>.broadcast();
  TextEditingController searchController = TextEditingController();

  Stream<SwipeRefreshState> get _stream => _swipeController.stream;

  Future<void> _refresh() async {
    _controller.getAstronomyPicturesOfTheDay().then((value) {
      _swipeController.sink.add(SwipeRefreshState.hidden);
    });
  }

  @override
  void initState() {
    _controller.getAstronomyPicturesOfTheDay();
    super.initState();
  }

  @override
  void dispose() {
    _swipeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'Astronomy Pictures Of the Day',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchField(),
            _buildPicturesOfTheDayList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          onChanged: (searchTerm) {
            _controller.searchPicture(searchTerm);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search for name or date of the picture..',
            labelStyle: TextStyle(fontSize: 14),
            suffixIcon: Icon(Icons.search),
          ),
        ),
      );
    });
  }

  Widget _buildPicturesOfTheDayList() {
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
            );
          },
        ),
      );
    });
  }
}
