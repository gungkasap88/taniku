import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/response_login_model.dart';
import '../../model/response_register_model.dart';


class LoginApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future <respon_login_model> loginview (String username, String password, BuildContext context) async{
    var uri = Uri.parse(baseUrl + "api/niaga/auth/login").replace();
    Map<String, String> headers() {
      return { 'Content-Type' : 'application/json',  'Accept' : 'application/json'};
    }
    var _body = jsonEncode({
      'username' : username,
      'password' : password
    });
    try {
      final response = await client
          .post(uri, headers: headers(), body: _body)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        return respon_login_model.fromJson(jsonDecode(response.body));
      } else{
        return respon_login_model.withError("gagal load data");
      }
    } on TimeoutException catch (_) {
      return respon_login_model.withError("wakru habis, silahkan coba lagi");
    }
  }

  Future <respon_register_model> register ( String user, String nama, String nohp, String password, String confirmpassword, BuildContext context) async{
    var uri = Uri.parse(baseUrl + "api/niaga/auth/register").replace();
    Map<String, String> headers() {
      return { 'Content-Type' : 'application/json',  'Accept' : 'application/json'};
    }
    var _body = jsonEncode({
      'type_user': user,
      'name' : nama,
      'mobile' : nohp,
      'password' : password,
      'confirm_password' : confirmpassword,
    });
    try {
      final response = await client
          .post(uri, headers: headers(), body: _body)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(response.body);
        return respon_register_model.fromJson(jsonDecode(response.body));
      } else{
        return respon_register_model.withError("gagal load data");
      }
    } on TimeoutException catch (_) {
      return respon_register_model.withError("wakru habis, silahkan coba lagi");
    }
  }

}
