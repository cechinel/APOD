import 'package:apod/app/presentation/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomePageController>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        key: const Key('search_fields'),
        onChanged: controller.searchPicture,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search for name or date of the picture..',
          labelStyle: TextStyle(fontSize: 14),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
