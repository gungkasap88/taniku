import 'package:flutter/material.dart';
import 'package:taniku/service/api/addkebun_api.dart';

import '../model/response_add_kebun.dart';

class AddKebunViewModel extends ChangeNotifier{
  final _addkebunviewmodel = AddKebunApi();
  AddKebunModel addKebunModel = AddKebunModel();

  void AddKebun(BuildContext context) async {
    final response = await _addkebunviewmodel.AddKebun(addKebunModel, context);
    print(response);
    notifyListeners();
  }

}