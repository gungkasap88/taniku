import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../model/response_transaksi.dart';
import '../service/api/transaksi_api.dart';

class TransaksiViewModel extends ChangeNotifier{
  final _transaksiApi = TransaksiApi();
  List<Data> getTransaksi = [];

  TransaksiViewModel(BuildContext context){
    getDataTransaksi(context);
  }

  void getDataTransaksi(BuildContext context) async {
    final response = await _transaksiApi.getDataTransaksi(context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getTransaksi = response.data!;
        print(jsonEncode(getTransaksi));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}