import 'package:apod/app/presentation/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = Modular.get<HomePageController>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        key: const Key('search_fields'),
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
  }
}
