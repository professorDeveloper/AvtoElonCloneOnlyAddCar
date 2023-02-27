import 'package:avto_elon/core/api/form_api.dart';
import 'package:avto_elon/core/models/distict_model.dart';
import 'package:avto_elon/core/models/model_model.dart';
import 'package:avto_elon/core/models/region_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';

import '../core/models/brand_model.dart';

class ModelsProvider extends ChangeNotifier {
  late List<BrandModel> results;

  late List<CarModel> resultsModels;

  late List<BrandModel> filteredItems;

  late List<RegionModel> resultRegions;

  late List<DistrictModel> resultDistricts;

  late bool progress;
  final api = FormApi(Dio());
  var brent = TextEditingController();

  loadDataBrands() async {
    progress = true;
    notifyListeners();
   await Future.delayed(Duration(milliseconds: 200));
    filteredItems = (await api.brands());

    results = filteredItems;
    progress = false;
    notifyListeners();
  }

  void changeBrendSearch(List<BrandModel> results) {
    results = results;
    notifyListeners();
  }

  loadRegions() async {
    progress = true;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 200));
    resultRegions = (await api.regions());
    progress = false;
    notifyListeners();
  }

  loadDistricts(String regionId) async {
    progress = true;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 200));
    resultDistricts = (await api.districts(regionId));
    progress = false;
    notifyListeners();
  }

  loadDataModels(String brandId) async {
    progress = true;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 200));
    resultsModels = (await api.models(brandId));
    progress = false;
    notifyListeners();
  }
}
