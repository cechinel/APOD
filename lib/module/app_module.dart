import 'package:flutter_modular/flutter_modular.dart';

import '../app/presentation/home/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        "/",
        child: (context) => const HomePage(),
      ),
    );
  }
}
