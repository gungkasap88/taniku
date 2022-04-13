import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/response_pengiriman.dart';
import '../service/api/pengiriman_api.dart';
import '../view/pengirimanPage.dart';

class PengirimanViewModel extends ChangeNotifier{
  final _pengirimanApi = PengirimanApi();
  List<Data> getPengiriman = [];

  PengirimanViewModel(BuildContext context){
    getDataPengiriman(context);
  }

  void getDataPengiriman(BuildContext context) async {
    final response = await _pengirimanApi.getDataPengiriman(context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => PengirimanPage()));
        getPengiriman = response.data!;
        print(jsonEncode(getPengiriman));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}