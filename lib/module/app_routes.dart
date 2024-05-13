import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes {
  static void goToDetailPage(ApodDto picture) {
    Modular.to.pushNamed('/details', arguments: picture);
  }
}
