import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_pengiriman.dart';
import 'package:taniku/service/api/token.dart';

class PengirimanApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <ResponsePengiriman> getDataPengiriman(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/reservasi/getAll").replace();
    Map<String, String> headersToken() {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'page': "1",
      'sort': "desc",
      'status': "",
      'type_user': "PTN",
      'user_id': "85"

    });
    print(token);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ResponsePengiriman.fromJson(jsonDecode(response.body));
      } else{
        return ResponsePengiriman.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return ResponsePengiriman.withError("waktu habis, silahkan coba kembali");
    }
  }
}