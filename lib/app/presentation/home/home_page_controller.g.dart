// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on HomePageControllerBase, Store {
  late final _$picturesOfTheDayListAtom = Atom(
      name: 'HomePageControllerBase.picturesOfTheDayList', context: context);

  @override
  ObservableList<ApodDto> get picturesOfTheDayList {
    _$picturesOfTheDayListAtom.reportRead();
    return super.picturesOfTheDayList;
  }

  @override
  set picturesOfTheDayList(ObservableList<ApodDto> value) {
    _$picturesOfTheDayListAtom.reportWrite(value, super.picturesOfTheDayList,
        () {
      super.picturesOfTheDayList = value;
    });
  }

  late final _$searchResultsAtom =
      Atom(name: 'HomePageControllerBase.searchResults', context: context);

  @override
  ObservableList<ApodDto> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<ApodDto> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  @override
  String toString() {
    return '''
picturesOfTheDayList: ${picturesOfTheDayList},
searchResults: ${searchResults}
    ''';
  }
}
