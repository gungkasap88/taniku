import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../model/response_profile.dart';
import '../service/api/profile_api.dart';
import '../service/local/shared_pref_service.dart';

class ProfilViewModel extends ChangeNotifier{
  final _profileApi = ProfileApi();
  final _sharedPref = shared_pref_service();
  Data dataProfile = new Data();

  ProfilViewModel(BuildContext context){
    getProfile(context);
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

}