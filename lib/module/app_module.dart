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
import '../services/client_https/interceptors/api_key_interceptor.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // usecases
    i.addLazySingleton<GetApodUsecase>(GetApodUsecaseImpl.new);

    // repositories
    i.addLazySingleton<GetApodRepository>(GetApodRepositoryImpl.new);

    // datasources
    i.addLazySingleton<GetApodDatasource>(GetApodDatasourceImpl.new);

    // controllers
    i.addLazySingleton(HomePageController.new);

    // client
    i.addLazySingleton<ClientHttps>(() {
      return ClientHttps(interceptors: [ApiKeyInterceptor()]);
    });
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const HomePage(),
    );
    r.child(
      '/details',
      child: (_) => DetailsPage(
        picture: r.args.data as ApodDto,
      ),
    );
  }
}
