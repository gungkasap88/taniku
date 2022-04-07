import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/view/buttonNav.dart';
import 'package:taniku/view/loginPage.dart';
import '../model/response_login_model.dart';
import '../service/api/login_api.dart';
import '../service/local/shared_pref_service.dart';

class LoginViewModel extends ChangeNotifier{
  final _loginApi = LoginApi();
  final _sharedPref = shared_pref_service();
  Data dataLogin = new Data();


  LoginViewModel(BuildContext){}
  void loginview(String username, String password, BuildContext context) async{
    final response = await _loginApi.loginview(username, password, context);
    if (response.error == null) {
      if (response.isSuccess = true) {
        dataLogin = response.data!;
        // _sharedPref.setStringSharedPref("token", dataLogin.token.toString());
        // _sharedPref.setStringSharedPref("petani_id", dataLogin.detail!.petaniId.toString());
        // _sharedPref.setStringSharedPref("user_id", dataLogin.userId.toString());
        print(jsonEncode(dataLogin));
        Navigator.push(context, MaterialPageRoute(builder: (context) => buttonNav()));
      }else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  Future<bool> loginWithReturn(String username, String password, BuildContext context) async{
    final response = await _loginApi.loginview(username, password, context);
    if ( response.error == null){
      if(response.isSuccess == true){
        dataLogin = response.data!;
        _sharedPref.setStringSharedPref("token", dataLogin.token.toString());
        _sharedPref.setStringSharedPref("petani_id", dataLogin.detail!.petaniId.toString());
        _sharedPref.setStringSharedPref("user_id", dataLogin.userId.toString());
        print(jsonEncode(dataLogin));
        final token = await _sharedPref.getStringSharedPref("token");
        final petani = await _sharedPref.getStringSharedPref("petani_id");
        print(token);
        print(petani);
        return true;
      } else{
        print(response.message.toString());
        return false;
      }
    } else{
      print(response.error.toString());
      return false;
    }
  }

  void register( String user, String nama, String nohp, String password, String confirmpassword, BuildContext context) async{
    final response = await _loginApi.register( user, nama, nohp, password, confirmpassword, context);
    if (response.error == null) {
      if (response.isSuccess = true) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
      }else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}

