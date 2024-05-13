import 'package:apod/app/data/datasources/get_apod_datasource.dart';
import 'package:apod/app/data/repositories/get_apod_repository_impl.dart';
import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/repositories/get_apod_repository.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase_impl.dart';
import 'package:apod/app/external/get_apod_datasource_impl.dart';
import 'package:apod/app/presentation/home/home_page_controller.dart';
import 'package:apod/services/client_https/client_https.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/presentation/details/details_page.dart';
import '../app/presentation/home/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // usecases
    i.addSingleton<GetApodUsecase>(GetApodUsecaseImpl.new);

    // repositories
    i.addSingleton<GetApodRepository>(GetApodRepositoryImpl.new);

    // datasources
    i.addSingleton<GetApodDatasource>(GetApodDatasourceImpl.new);

    // controllers
    i.addSingleton(HomePageController.new);

    // client
    i.addSingleton(ClientHttps.new);
  }

  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        "/",
        child: (_) => const HomePage(),
      ),
    );
    r.add(
      ChildRoute(
        '/details',
        child: (_) => DetailsPage(
          picture: r.args.data as ApodDto,
        ),
      ),
    );
  }
}
