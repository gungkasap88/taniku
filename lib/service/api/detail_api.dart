import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/response_find_one_kebun.dart';

class DetailApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <FindOneKebun> getDetailKebun(String kebunId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/findOneKebun").replace();
    var token = 'N2IyN2I0N2ZmZGU3MmE4NjgxNDhjZGZlNTA4ZGFhZTY0Zjc4YmI0Yw==';
    Map<String, String> headersToken() {
      return{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'user_id' : "85",
      'kebun_id' : kebunId,

    });
    print(token);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return FindOneKebun.fromJson(jsonDecode(response.body));
      } else{
        return FindOneKebun.withError("gagal load");
      }
    } on TimeoutException catch (_) {
      return FindOneKebun.withError("waktu habis, silahkan coba kembali");
    }
  }}