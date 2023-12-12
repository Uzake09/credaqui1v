
import 'package:flutter/material.dart';

import 'package:untitled2/services/authenticator.dart';

class HomePageController extends ChangeNotifier {



  int aux = 0;

  String _userName = '';
  String get userName => _userName;


  List<double> valoresMensais = [];

  double total = 0.0;



  HomePageController() {}



  






  changeUserName(String value) {
    _userName = value;
    notifyListeners();
  }

  




  String getUserName() {
    if (aux == 0) {
      getNome();
    }
    aux++;
    return userName;
  }

  Future<void> getNome() async {
    String name = '';
    AuthenticationService authenticationService = AuthenticationService();
    name = await authenticationService.getUserName(email: 'email');
    changeUserName(name);
  }

  
  
}


