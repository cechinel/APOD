import 'package:apod/app/domain/usecases/get_apod_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('Should call a request to get an Astronomy Picture when is success',
      () async {
    final usecase = GetApodUsecaseImpl();
    await usecase();
    verify(usecase());
  });
}
