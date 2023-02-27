import 'package:avto_elon/core/models/brand_model.dart';
import 'package:avto_elon/core/models/distict_model.dart';
import 'package:avto_elon/core/models/model_model.dart';
import 'package:dio/dio.dart';

import '../models/region_model.dart';

class FormApi {
     Dio dio;

     FormApi(this.dio);

  Future<List<RegionModel>> regions() async {
    await Future.delayed(const Duration(milliseconds: 400));
    final response = await dio.get("https://openbudget.uz/api/v1/regions");
    return (response.data["regions"] as List)
        .map((e) => RegionModel.fromJson(e))
        .toList();
  }

  Future<List<DistrictModel>> districts(String regionId) async {
    final response = await dio.get(
      "https://openbudget.uz/api/v1/districts?region_id=$regionId",
    );
    return (response.data["districts"] as List)
        .map((e) => DistrictModel.fromJson(e))
        .toList();
  }

  Future<List<BrandModel>> brands() async {
    final response = await dio.get("https://m.avtoelon.uz/avto/brands/");
    return (response.data as List)
        .map((e) => BrandModel.fromJson(e))
        .toList();
  }

  Future<List<CarModel>> models(String brandId) async {
    final response = await dio.get("https://m.avtoelon.uz/avto/models/$brandId/");
    return (response.data as List)
        .map((e) => CarModel.fromJson(e))
        .toList();
    ;
  }
}
