import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/presentation/home/home_page_controller.dart';
import 'package:mockito/mockito.dart';

class HomePageControllerSpy extends Mock implements HomePageController {
  bool getAstronomyPictureOfTheDayCalled = false;
  bool searchPictureCalled = false;

  @override
  Future<void> getAstronomyPicturesOfTheDay({
    int size = 12,
    DateTime? date,
  }) async {
    getAstronomyPictureOfTheDayCalled = true;

    return super.noSuchMethod(
      Invocation.method(#getAstronomyPicturesOfTheDay, []),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }

  @override
  searchPicture(String? searchTerm) {
    searchPictureCalled = true;
    return super.noSuchMethod(
      Invocation.method(#searchPicture, []),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }

  @override
  List<ApodDto> picturesOfTheDayList = <ApodDto>[];

  @override
  List<ApodDto> searchResults = <ApodDto>[];
}
