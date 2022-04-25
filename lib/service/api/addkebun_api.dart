import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../model/response_add_kebun.dart';
import '../local/shared_pref_service.dart';

class AddKebunApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<String> AddKebun(AddKebunModel addKebunModel, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/addKebun").replace();
    final tokenLocal = await shared_pref_service().getStringSharedPref("token");
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokenLocal'
      };
    }
    var _body = jsonEncode(addKebunModel);
    print(tokenLocal);
    print(_body);
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return "";
      } else {
        return "";
      }
    } on TimeoutException catch (_) {
      return "";
    }
  }

}