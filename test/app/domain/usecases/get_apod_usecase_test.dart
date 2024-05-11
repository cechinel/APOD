import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/domain/repositories/get_apod_repository.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase.dart';
import 'package:apod/app/domain/usecases/get_apod_usecase_impl.dart';
import 'package:apod/services/exceptions/apod_generic_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/mocks.dart';
import 'get_apod_usecase_test.mocks.dart';

@GenerateMocks([GetApodRepository])
void main() {
  late GetApodUsecase usecase;
  late GetApodRepository repository;
  late ApodDto apodDtoFaker;

  setUp(() {
    repository = MockGetApodRepository();
    usecase = GetApodUsecaseImpl(repository);

    apodDtoFaker = Mocks.astronomyPictureOfTheDay;
  });

  test('Should return an ApodEntity when request is success', () async {
    when(repository()).thenAnswer((_) => Future.value(apodDtoFaker));

    final astronomyPictureOfTheDay = await usecase();

    expect(astronomyPictureOfTheDay, isA<ApodDto>());
  });

  test('Should return an exception when request fails', () async {
    when(repository()).thenThrow(Exception());

    final result = usecase();

    expect(result, throwsA(isA<ApodGenericException>()));
  });
}
