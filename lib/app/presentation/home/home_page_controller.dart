import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:intl/intl.dart';
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

  @observable
  ObservableList<ApodDto> searchResults = <ApodDto>[].asObservable();

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

  searchPicture(String searchTerm) {
    print(searchTerm);
    if (searchTerm.isEmpty) {
      searchResults = picturesOfTheDayList;
      return;
    }

    DateTime? searchDate;
    try {
      searchDate = DateFormat('MM/dd/yyyy').parseStrict(searchTerm);
    } catch (_) {}

    if (searchDate != null) {
      searchResults = picturesOfTheDayList
          .where((picture) => picture.date.isAtSameMomentAs(searchDate!))
          .toList()
          .asObservable();
    } else {
      searchResults = picturesOfTheDayList
          .where((picture) =>
              picture.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList()
          .asObservable();
    }
  }
}
