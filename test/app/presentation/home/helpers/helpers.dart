import 'package:flutter/material.dart';

class MakePage extends StatelessWidget {
  final Widget page;
  const MakePage({
    required this.page,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: page);
  }
}
