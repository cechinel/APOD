import 'package:apod/app/data/datasources/get_apod_datasource.dart';
import 'package:apod/app/data/repositories/get_apod_repository_impl.dart';
import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/repositories/create_apod_in_cache_repository.dart';
import 'package:apod/app/domain/repositories/get_apod_in_cache_repository.dart';
import 'package:apod/app/domain/repositories/get_apod_repository.dart';
import 'package:apod/app/domain/usecases/create_apod_in_cache_usecase.dart';
import 'package:apod/app/domain/usecases/create_apod_in_cache_usecase_impl.dart';
import 'package:apod/app/domain/usecases/get_apod_in_cache_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase_impl.dart';
import 'package:apod/app/external/get_apod_datasource_impl.dart';
import 'package:apod/app/presentation/home/home_page_controller.dart';
import 'package:apod/services/client_https/client_https.dart';
import 'package:apod/services/client_https/interceptors/error_handle_interceptor.dart';
import 'package:apod/services/client_https/interceptors/headers_interceptors.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/data/datasources/create_apod_in_cache_datasource.dart';
import '../app/data/datasources/get_apod_in_cache_datasource.dart';
import '../app/data/repositories/create_apod_in_cache_repository_impl.dart';
import '../app/data/repositories/get_apod_in_cache_repository_impl.dart';
import '../app/domain/usecases/get_apod_in_cache_usecase_impl.dart';
import '../app/external/create_apod_in_cache_datasource_impl.dart';
import '../app/external/get_apod_in_cache_datasource_impl.dart';
import '../app/presentation/details/details_page.dart';
import '../app/presentation/home/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // usecases
    i.addLazySingleton<GetApodUsecase>(GetApodUsecaseImpl.new);
    i.addLazySingleton<GetApodInCacheUsecase>(GetApodInCacheUsecaseImpl.new);
    i.addLazySingleton<CreateApodInCacheUsecase>(
        CreateApodInCacheUsecaseImpl.new);

    // repositories
    i.addLazySingleton<GetApodRepository>(GetApodRepositoryImpl.new);
    i.addLazySingleton<GetApodInCacheRepository>(
        GetApodInCacheRepositoryImpl.new);
    i.addLazySingleton<CreateApodInCacheRepository>(
        CreateApodInCacheRepositoryImpl.new);

    // datasources
    i.addLazySingleton<GetApodDatasource>(GetApodDatasourceImpl.new);
    i.addLazySingleton<GetApodInCacheDatasource>(
        GetApodInCacheDataSourceImpl.new);
    i.addLazySingleton<CreateApodInCacheDataSource>(
        CreateApodInCacheDataSourceImpl.new);

    // controllers
    i.addLazySingleton(HomePageController.new);

    // client
    i.addLazySingleton<ClientHttps>(() {
      return ClientHttps(interceptors: [
        HeadersInterceptors(),
        ErrorHandleInterceptor(),
      ]);
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
