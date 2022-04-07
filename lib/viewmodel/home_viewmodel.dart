import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_news.dart';

import '../service/api/home_api.dart';
import '../service/local/shared_pref_service.dart';

class HomeViewModel extends ChangeNotifier{
  final _homeApi = HomeApi();
  final _sharedPref = shared_pref_service();
  List<Data> getNews = [];

  HomeViewModel(BuildContext context){
    getDataNews(context);
  }

  void getDataNews(BuildContext context) async {
    final response = await _homeApi.getDataNews(context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        getNews = response.data!;
        print(jsonEncode(ResponseNews));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

}