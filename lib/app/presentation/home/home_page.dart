import 'package:apod/app/presentation/home/widgets/picture_of_the_day_session.dart';
import 'package:flutter/material.dart';

import 'widgets/pictures_list_session.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Astronomy Picture Of the Day',
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
          _buildPictureOfTheDaySession(),
          _buildPicturesListSession(),
        ],
      ),
    );
  }

  Widget _buildPictureOfTheDaySession() {
    return const PictureOfTheDaySession(
      title: 'Picture Of the Day!',
      pictureTitle: 'Picture title',
      picture: 'picture url',
    );
  }

  Widget _buildPicturesListSession() {
    return const PicturesListSession(
      sessionTitle: 'Pictures',
      picture: 'picture url',
      pictureTitle: 'picture title',
      pictureDate: 'picture date',
    );
  }
}
