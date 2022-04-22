import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/model/response_list_user.dart';
import 'package:taniku/model/response_sertifikasi.dart';
import 'package:taniku/view/db.dart';

import '../service/api/sertifikasi_api.dart';

class SertifikasiViewModel extends ChangeNotifier{
  final _detailSertifikasi = SertifikasiApi();
  final _dbLocal = MyDb();
  List<DataSertifikasi> dataSertifikasi = [];
  List<ListUserModel> listuser = [];

  SertifikasiViewModel(BuildContext context){
    getDataSertifikasi(context);
    getListUser(context);
  }

  void getDataSertifikasi(BuildContext context) async {
    final response = await _detailSertifikasi.getSertifikasi(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataSertifikasi = response.data!;
        print(jsonEncode(dataSertifikasi));
      } else {
        print(response.error.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void addUser(String sertifikat, String nosertifikat, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.addUser(sertifikat, nosertifikat, context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Tambah Data")));
    notifyListeners();
  }

  void getListUser(BuildContext context) async {
    await _dbLocal.open();
    final response = await _dbLocal.getListUser(context);
    if (response.isNotEmpty) {
      listuser = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  void deleteUser(int id, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.deleteUser(id, context);
    getListUser(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Edit Data")));
    notifyListeners();
  }

}