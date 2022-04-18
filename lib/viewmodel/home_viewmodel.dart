import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_news.dart';

import '../model/response_kebun.dart';
import '../model/response_profile.dart';
import '../service/api/home_api.dart';
import '../service/api/kebun_api.dart';
import '../service/api/profile_api.dart';
import '../service/local/shared_pref_service.dart';

class HomeViewModel extends ChangeNotifier{
  final _homeApi = HomeApi();
  final _getKebun = KebunApi();
  final _profileApi = ProfileApi();
  List<Data> getNews = [];
  List<Data1> getKebun = [];
  Data2 dataProfile = new Data2();
  final _sharedPref = shared_pref_service();

  HomeViewModel(BuildContext context){
    getDataNews(context);
    getDataKebun(context);
    getProfile(context);
  }

  void getDataNews(BuildContext context) async {
    final response = await _homeApi.getDataNews(context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getNews = response.data!;
        print(jsonEncode(getNews));
      } else {
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