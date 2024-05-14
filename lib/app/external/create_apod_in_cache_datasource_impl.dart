import 'dart:convert';

import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/storage_constants_keys.dart';
import '../data/datasources/create_apod_in_cache_datasource.dart';

class CreateApodInCacheDataSourceImpl implements CreateApodInCacheDataSource {
  @override
  Future<void> call(List<ApodDto> apodDto) async {
    final storage = await SharedPreferences.getInstance();
    const key = StorageConstantsKeys.apodKey;
    final listMap = apodDto.map((e) => e.toMap()).toList();
    final json = jsonEncode(listMap);

    await storage.setString(key, json);
  }
}
