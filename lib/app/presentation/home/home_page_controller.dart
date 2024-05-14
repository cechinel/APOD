import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/usecases/create_apod_in_cache_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_in_cache_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../services/exceptions/apod_server_exception.dart';

part 'home_page_controller.g.dart';

class HomePageController = HomePageControllerBase with _$HomePageController;

abstract class HomePageControllerBase with Store {
  final GetApodUsecase _getApodUsecase;
  final CreateApodInCacheUsecase _createApodInCacheUsecase;
  final GetApodInCacheUsecase _getApodInCacheUsecase;

  HomePageControllerBase(
    this._getApodUsecase,
    this._createApodInCacheUsecase,
    this._getApodInCacheUsecase,
  );

  @observable
  bool loading = false;

  @observable
  List<ApodDto> picturesOfTheDayList = <ApodDto>[];

  @observable
  List<ApodDto> searchResults = <ApodDto>[];

  Future<void> getAstronomyPicturesOfTheDay({
    int size = 12,
    DateTime? date,
  }) async {
    try {
      loading = true;
      picturesOfTheDayList = await _getApodUsecase(size: size, date: date);

      await _createApodInCacheUsecase(picturesOfTheDayList);
    } on ApodServerException {
      picturesOfTheDayList = await _getApodInCacheUsecase();
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  searchPicture(String? searchTerm) {
    if ((searchTerm ?? '').isEmpty) {
      searchResults = picturesOfTheDayList;
      return;
    }

    DateTime? searchDate;
    try {
      searchDate = DateFormat('MM/dd/yyyy').parseStrict(searchTerm!);
    } catch (_) {}

    if (searchDate != null) {
      searchResults = picturesOfTheDayList
          .where((picture) => picture.date.isAtSameMomentAs(searchDate!))
          .toList();
    } else {
      searchResults = picturesOfTheDayList
          .where((picture) =>
              picture.title.toLowerCase().contains(searchTerm!.toLowerCase()))
          .toList();
    }
  }
}
