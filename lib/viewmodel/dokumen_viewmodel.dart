import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/model/response_add_kebun.dart';
import 'package:taniku/model/response_dokumen.dart';
import 'package:taniku/service/api/jenisdokumen_api.dart';
import 'package:taniku/view/db.dart';

import '../model/response_list_dokumen.dart';

class DokumenViewModel extends ChangeNotifier{
  final _detailJenisDokumen = JenisDokumenApi();
  final _dbLocal = MyDb();
  ListDokumenModel dataDok = ListDokumenModel();
  List<DataDokumen> dataDokumen = [];
  List<ListDokumenModel> listdokumen = [];
  List<ListDokumen> dokumenApi = []; // Ini untuk convert agar masuk ke AddKebun

  DokumenViewModel(BuildContext context){
    getDataDokumen(context);
    getListDokumen(context);
    convertDokumenList(context);
    //getDokumenById(id, context);
  }

  void getDataTipeDokumen(BuildContext context) async {
    final response = await _detailJenisDokumen.getDokumen(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataDokumen = response.data!;
        print(jsonEncode(dataDokumen));
      } else {
        print(response.error.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getDataDokumen(BuildContext context) async {
    final response = await _detailJenisDokumen.getDokumen(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataDokumen = response.data!;
        print(jsonEncode(dataDokumen));
      } else {
        print(response.error.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void addDokumen(String dokumen, String nodokumen, Uint8List foto, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.addDokumen(dokumen, nodokumen, foto, context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Tambah Data")));
    getListDokumen(context);
    notifyListeners();
  }

  void getListDokumen(BuildContext context) async {
    await _dbLocal.open();
    final response = await _dbLocal.getListDokumen(context);
    if (response.isNotEmpty) {
      listdokumen.clear();
      listdokumen = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  void deletedDokumen(int id, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.deleteDokumen(id, context);
    getListDokumen(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Edit Data")));
    notifyListeners();
  }

  getDokumenById(int id, BuildContext context) async {
    await _dbLocal.open();
    final response = await _dbLocal.getDokumenById(id, context);
    if (response != null) {
      dataDok = response;
    } else {
      print("Tidak Ada Data");
    }
    notifyListeners();
  }

  void editDokumen(int id, String dokumen, String nodokumen, Uint8List foto, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.editDokumen(id, dokumen, nodokumen, foto, context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Edit Data")));
    getListDokumen(context);
    notifyListeners();
  }

  convertDokumenList(BuildContext context) async {
    await _dbLocal.open();
    final response = await _dbLocal.convertListDokumen();
    if (response.isNotEmpty) {
      dokumenApi.clear(); // Ada di response add kebun bagian dokumen
      dokumenApi = response;
    } else {
      print("Tidak Ada Data");
    }
    print(response.length);
    notifyListeners();
  }

}