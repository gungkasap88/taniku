import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../model/response_kebun.dart';
import '../model/response_profile.dart';
import '../service/api/kebun_api.dart';
import '../service/api/profile_api.dart';
import '../service/local/shared_pref_service.dart';

class ProfilViewModel extends ChangeNotifier{
  final _profileApi = ProfileApi();
  final _sharedPref = shared_pref_service();
  Data2 dataProfile = new Data2();
  final _getKebun = KebunApi();
  List<Data1> getKebun = [];

  ProfilViewModel(BuildContext context){
    getProfile(context);
    getDataKebun(context);
  }

  void getProfile(BuildContext context) async{
    final response = await _profileApi.getProfile(context);
    if (response.error == null) {
      if (response.isSuccess = true) {
        dataProfile = response.data!;
        print(jsonEncode(dataProfile));
      }else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getDataKebun(BuildContext context) async{
    final response = await _getKebun.getDataKebun(context);
    if (response.error == null){
      if (response.isSuccess == true){
        getKebun = response.data1!;
        print(jsonEncode(getKebun));
        // print(response.message.toString());
      } else {
        print (response.message.toString());
      }
    } else {
      print (response.error.toString());
    }
    notifyListeners();
  }

}