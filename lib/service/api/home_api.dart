import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/service/local/shared_pref_service.dart';

import '../../model/response_news.dart';

class HomeApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<ResponseNews> getDataNews(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/news").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    final petaniIdLocal = await shared_pref_service().getStringSharedPref("petani_id");
    final userIdLocal = await shared_pref_service().getStringSharedPref("user_id");
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'orderBy': "id",
      'petani_id': petaniIdLocal,
      'sort': "asc",
      'user_id': userIdLocal,
    });
    print(tokenLocal);
    print(_body);
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponseNews.fromJson(jsonDecode(response.body));
      } else {
        return ResponseNews.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return ResponseNews.withError("Waktu Habis, Silahkan Coba Kembali");
    }
  }

}