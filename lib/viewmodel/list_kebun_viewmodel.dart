import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_find_one_kebun.dart';
import 'package:taniku/model/response_sertifikat_list.dart';
import 'package:taniku/service/api/detail_api.dart';
import 'package:taniku/service/api/dokumen_api.dart';
import 'package:taniku/service/api/sertifikat_api.dart';

import '../model/response_kebun_sertifikat.dart';
import '../service/local/shared_pref_service.dart';

class ListKebunViewModel extends ChangeNotifier{
  final _detailApi = DetailApi();
  final _dokumenApi = DokumenApi();
  final _sertifikatApi = SertifikatApi();
  List<Data> getDetail = [];
  List<DataS> getDokumen = [];
  List<DataL> getSertifikat = [];
  final _sharedPref = shared_pref_service();

  ListKebunViewModel(String kebunId, BuildContext context){
    getDetailKebun(kebunId, context);
    getDetailDokumen(kebunId, context);
    getDetailSertifikat(kebunId, context);
  }

  void getDetailKebun(String kebunId, BuildContext context) async {
    final response = await _detailApi.getDetailKebun(kebunId, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getDetail = response.data!;
        print(jsonEncode(getDetail));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getDetailDokumen(String kebunId, BuildContext context) async {
    final response = await _dokumenApi.getDetailDokumen(kebunId, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getDokumen = response.data!;
        print(jsonEncode(getDokumen));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getDetailSertifikat(String kebunId, BuildContext context) async {
    final response = await _sertifikatApi.getDetailSertifikat(kebunId, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getSertifikat = response.data!;
        print(jsonEncode(getSertifikat));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

}