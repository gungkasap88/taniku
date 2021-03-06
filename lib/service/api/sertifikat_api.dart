import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/service/api/token.dart';

import '../../model/response_sertifikat_list.dart';
import '../local/shared_pref_service.dart';

class SertifikatApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <SertifikatList> getDetailSertifikat(String kebunId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getSertifikatList").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    final userId = await shared_pref_service().getStringSharedPref("user_id");
    Map<String, String> headersToken(tokenLocal) {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLocal'
      };
    }
    var _body = jsonEncode({
      'user_id' : userId,
      'kebun_id' : kebunId,
      'orderBy' : "id",
      'sort' : "asc"

    });
    print(tokenLocal);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return SertifikatList.fromJson(jsonDecode(response.body));
      } else{
        return SertifikatList.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return SertifikatList.withError("waktu habis, silahkan coba kembali");
    }
  }}