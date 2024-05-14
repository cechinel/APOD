import 'dart:convert';

import 'package:apod/app/domain/models/apod_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/storage_constants_keys.dart';
import '../data/datasources/get_apod_in_cache_datasource.dart';

class GetApodInCacheDataSourceImpl implements GetApodInCacheDatasource {
  @override
  Future<List<ApodDto>> call() async {
    final storage = await SharedPreferences.getInstance();
    const key = StorageConstantsKeys.apodKey;

    final jsonString = storage.getString(key);
    List<ApodDto> apodList = [];

    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      apodList = jsonList.map((json) => ApodDto.fromMap(json)).toList();
    }

    return apodList;
  }
}
