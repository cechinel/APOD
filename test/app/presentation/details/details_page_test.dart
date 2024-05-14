import 'package:apod/app/presentation/details/details_page.dart';
import 'package:apod/module/app_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mocks.dart';
import '../home/helpers/helpers.dart';

void main() {
  late Mocks apodMock;

  setUp(() {
    apodMock = Mocks();
  });

  setUpAll(
    () => {
      Modular.bindModule(
        AppModule(),
      ),
    },
  );

  Future<void> loadPage(WidgetTester tester) async {
    await tester.pumpWidget(
      makePage(
        page: DetailsPage(picture: apodMock.astronomyPictureOfTheDay),
      ),
    );
  }

  group(
    'Tests for details page',
    () {
      testWidgets(
        'Should confirm that the details page appears correctly on the screen',
        (tester) async {
          await loadPage(tester);

          final detailsPageKey = find.byKey(const Key('details_page'));

          expect(detailsPageKey, findsOneWidget);
        },
      );
    },
  );
}
