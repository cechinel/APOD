import 'package:apod/app/presentation/home/home_page.dart';
import 'package:apod/app/presentation/home/home_page_controller.dart';
import 'package:apod/module/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/helpers.dart';
import 'helpers/home_page_controller_spy.dart';

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
    await tester.pumpWidget(const MakePage(page: HomePage()));
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

      testWidgets('Should call getAstronomyPicturesOfTheDay on start page',
          (tester) async {
        await loadPage(tester);

        await tester.pump();

        expect(controller.getAstronomyPictureOfTheDayCalled, isTrue);
      });

      testWidgets('Should call searchPicture on change text field',
          (tester) async {
        await loadPage(tester);

        await tester.pump();

        final textField = find.byType(TextField);

        await tester.enterText(textField, 'Moon');

        await tester.pump();

        expect(controller.searchPictureCalled, isTrue);
      });
    },
  );
}
