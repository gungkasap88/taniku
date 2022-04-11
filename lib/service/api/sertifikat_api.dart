import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/response_sertifikat_list.dart';

class SertifikatApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <SertifikatList> getDetailSertifikat(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getSertifikatList").replace();
    var token = 'MjZhYWNiMDE4YzlmYmFmYmIxMjgzNzgyZGFiMTM2NzVlOTQ0MTVkNQ==';
    Map<String, String> headersToken() {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'user_id' : "85",
      'kebun_id' : "56",
      'orderBy' : "id",
      'sort' : "asc"

    });
    print(token);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(), body: _body)
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