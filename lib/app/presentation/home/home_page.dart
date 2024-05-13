import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page_controller.dart';
import 'widgets/pictures_of_the_day_list.dart';
import 'widgets/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomePageController>();

  @override
  void initState() {
    _controller.getAstronomyPicturesOfTheDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: const Key('home_page'),
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
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(),
            PicturesOfTheDayList(),
          ],
        ),
      ),
    );
  }
}
