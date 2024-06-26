import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'module/app_module.dart';
import 'module/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
