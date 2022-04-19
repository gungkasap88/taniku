import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_kecamatan.dart';
import 'package:taniku/model/response_kelurahan.dart';
import 'package:taniku/model/response_provinsi.dart';
import 'package:taniku/service/api/tambahkebun_api.dart';
import '../model/response_kota.dart';

class TambahKebunViewModel extends ChangeNotifier{
  final _detailAlamat = TambahKebunApi();
  List<DataProvinsi> getProvinsi = [];
  List<DataKota> getKota = [];
  List<DataKecamatan> getKecamatan = [];
  List<DataKelurahan> getKelurahan = [];

  TambahKebunViewModel(BuildContext context){
    getDetailProvinsi(context);
  }

  void getDetailProvinsi(BuildContext context) async {
    final response = await _detailAlamat.getProvinsi(context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getProvinsi = response.data!;
        print(jsonEncode(getProvinsi));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getDetailKota(String provinsiId, BuildContext context) async {
    final response = await _detailAlamat.getKota(provinsiId, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getKota = response.data!;
        print(jsonEncode(getKota));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getDetailKecamatan(String kotaId, BuildContext context) async {
    final response = await _detailAlamat.getKecamatan(kotaId, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getKecamatan = response.data!;
        print(jsonEncode(getKecamatan));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getDetailKelurahan(String kecamatanId, BuildContext context) async {
    final response = await _detailAlamat.getKelurahan(kecamatanId, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getKelurahan = response.data!;
        print(jsonEncode(getKelurahan));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}