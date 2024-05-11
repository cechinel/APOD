import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:mobx/mobx.dart';

part 'home_page_controller.g.dart';

class HomePageController = HomePageControllerBase with _$HomePageController;

abstract class HomePageControllerBase with Store {
  final GetApodUsecase _getApodUsecase;

  HomePageControllerBase(
    this._getApodUsecase,
  );

  @observable
  bool loading = false;

  @observable
  ApodDto? pictureOfTheDay;

  Future<void> getAstronomyPictureOfTheDay() async {
    try {
      loading = true;
      pictureOfTheDay = await _getApodUsecase();
    } catch (_) {}
  }
}
