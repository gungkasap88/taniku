import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/model/response_list_user.dart';
import 'package:taniku/model/response_sertifikasi.dart';
import 'package:taniku/view/db.dart';

import '../service/api/sertifikasi_api.dart';

class SertifikasiViewModel extends ChangeNotifier{
  final _detailSertifikasi = SertifikasiApi();
  final _dbLocal = MyDb();
  ListUserModel dataSer = ListUserModel();
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

  void addUser(String sertifikat, String nosertifikat, String tanggal, Uint8List foto, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.addUser(sertifikat, nosertifikat, tanggal, foto, context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Tambah Data")));
    getListUser(context);
    notifyListeners();
  }

  void getListUser(BuildContext context) async {
    await _dbLocal.open();
    final response = await _dbLocal.getListUser(context);
    if (response.isNotEmpty) {
      listuser.clear();
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

  getUserById(int id, BuildContext context) async {
    await _dbLocal.open();
    final response = await _dbLocal.getUserById(id, context);
    if (response != null) {
      dataSer = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  void editSertifikasi(int id, String sertifikat, String nosertifikat, String tanggal, Uint8List foto, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.editUser(id, sertifikat, nosertifikat, tanggal, foto, context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Edit Data")));
    getListUser(context);
    notifyListeners();
  }

}