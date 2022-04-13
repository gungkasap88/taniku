import 'package:flutter/material.dart';
import 'package:taniku/model/response_transaksi.dart';
import 'package:taniku/service/api/reservasiadd_api.dart';

class PersediaanViewModel extends ChangeNotifier {
  final _persediaanApi = PersediaanApi();
  List<Data> persediaan = [];

  PersediaanViewModel(BuildContext context){
  }

  void getDataPersediaan(BuildContext context) async {
    final response = await _persediaanApi.getDataPersediaan(context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        print(response.message.toString());
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

}