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
  ObservableList<ApodDto> picturesOfTheDayList = <ApodDto>[].asObservable();

  Future<void> getAstronomyPicturesOfTheDay({
    int size = 12,
    DateTime? date,
  }) async {
    try {
      loading = true;
      final pictures = await _getApodUsecase(size: size, date: date);

      picturesOfTheDayList = pictures.asObservable();
    } catch (_) {
    } finally {
      loading = false;
    }
  }
}
