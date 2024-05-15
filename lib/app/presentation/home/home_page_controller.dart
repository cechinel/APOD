import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/presentation/result_presentation.dart';
import 'package:apod/app/domain/usecases/create_apod_in_cache_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_in_cache_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../domain/models/exceptions/handle_exception.dart';

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
  ObservableList<ApodDto> picturesOfTheDayList = ObservableList<ApodDto>();

  @observable
  ObservableList<ApodDto> searchResults = ObservableList<ApodDto>();

  Future<ResultPresentation> getAstronomyPicturesOfTheDay({
    int size = 12,
    DateTime? date,
  }) async {
    picturesOfTheDayList.clear();
    try {
      picturesOfTheDayList.addAll(
        await _getApodUsecase(size: size, date: date),
      );
      await _createApodInCacheUsecase(picturesOfTheDayList.toList());
      return ResultPresentation();
    } on HandledException catch (e) {
      picturesOfTheDayList.addAll(await _getApodInCacheUsecase());
      if (picturesOfTheDayList.isNotEmpty) {
        return ResultPresentation();
      }
      return ResultPresentation.exception(e);
    }
  }

  searchPicture(String? searchTerm) {
    if ((searchTerm ?? '').isEmpty) {
      searchResults = picturesOfTheDayList;
      return;
    }

    DateTime? searchDate;
    searchDate = DateFormat('MM/dd/yyyy').tryParse(searchTerm!);
    searchResults.clear();

    if (searchDate != null) {
      searchResults.addAll(
        picturesOfTheDayList
            .where((picture) => picture.date.isAtSameMomentAs(searchDate!))
            .toList(),
      );
      return;
    }

    searchResults.addAll(
      picturesOfTheDayList
          .where((picture) =>
              picture.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList(),
    );
  }
}
