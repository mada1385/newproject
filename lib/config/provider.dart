import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier {
  String token;

  void settoken(String usertoken) {
    token = usertoken;
    notifyListeners();
  }
}
