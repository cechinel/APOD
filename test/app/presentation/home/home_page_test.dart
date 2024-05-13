import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:apod/app/presentation/home/home_page.dart';
import 'package:apod/app/presentation/home/home_page_controller.dart';
import 'package:apod/module/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helpers/helpers.dart';

class HomePageControllerSpy extends Mock implements HomePageController {
  @override
  Future<void> getAstronomyPicturesOfTheDay({
    int size = 12,
    DateTime? date,
  }) async {
    return super.noSuchMethod(
      Invocation.method(#getAstronomyPicturesOfTheDay, []),
      returnValue: Future.value(),
      returnValueForMissingStub: Future.value(),
    );
  }

  @override
  List<ApodDto> picturesOfTheDayList = <ApodDto>[];

  @override
  List<ApodDto> searchResults = <ApodDto>[];
}

void main() {
  late HomePageControllerSpy controller;

  setUpAll(
    () => {
      Modular.bindModule(
        AppModule(),
      ),
    },
  );

  setUp(
    () => {
      controller = HomePageControllerSpy(),
      Modular.replaceInstance<HomePageController>(controller),
    },
  );

  Future<void> loadPage(WidgetTester tester) async {
    await tester.pumpWidget(makePage(page: const HomePage()));
  }

  group(
    'Tests for home page',
    () {
      testWidgets(
        'Should confirm that the home page appears correctly on the screen ',
        (tester) async {
          await loadPage(tester);

          final homePageKey = find.byKey(const Key('home_page'));

          expect(homePageKey, findsOneWidget);
        },
      );
    },
  );
}
