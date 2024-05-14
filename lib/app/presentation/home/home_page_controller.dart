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
  List<ApodDto> picturesOfTheDayList = <ApodDto>[];

  @observable
  List<ApodDto> searchResults = <ApodDto>[];

  Future<void> getAstronomyPicturesOfTheDay({
    int size = 12,
    DateTime? date,
  }) async {
    try {
      picturesOfTheDayList = await _getApodUsecase(size: size, date: date);

      await _createApodInCacheUsecase(picturesOfTheDayList);
    } on ApodServerException {
      picturesOfTheDayList = await _getApodInCacheUsecase();
    }
  }

  searchPicture(String? searchTerm) {
    if ((searchTerm ?? '').isEmpty) {
      searchResults = picturesOfTheDayList;
      return;
    }

    DateTime? searchDate;
    searchDate = DateFormat('MM/dd/yyyy').tryParse(searchTerm!);

    if (searchDate != null) {
      searchResults = picturesOfTheDayList
          .where((picture) => picture.date.isAtSameMomentAs(searchDate!))
          .toList();
      return;
    }

    searchResults = picturesOfTheDayList
        .where((picture) =>
            picture.title.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
}
