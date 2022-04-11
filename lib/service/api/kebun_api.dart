import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/response_kebun.dart';
import '../local/shared_pref_service.dart';

class KebunApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <ResponseKebun> getDataKebun(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getKebun").replace();
    var token = 'MzlhZDNjNjlkMGFmOThkOTNjOTVhNDkxMDYzMGQ4ZDIwZjNmZTUyZQ==';
    Map<String, String> headersToken() {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'orderBy' : "id",
      'petani_id' : "46",
      'sort' : "asc",
      'user_id' : "85",

    });
    print(token);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponseKebun.fromJson(jsonDecode(response.body));
      } else{
        return ResponseKebun.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponseKebun.withError("waktu habis, silahkan coba kembali");
    }
  }}