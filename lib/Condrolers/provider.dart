import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/servieces/quistonsApi.dart';


class Providers extends ChangeNotifier {
  bool button_color_chage_provider = false;
  bool button_color_chage2_provider = false;
  bool button_color_chage3_provider = false;
  bool button_color_chage4_provider = false;
  int buttonpress_provider = 0;
  int markindex_provider = 0;
  int mark_provider = 0;
  int num_provider = 1;
  int questions_Index = 0;
  int choices_provider = 0;
   int buttonIndex=5;


  changeButtonColor1() {
    markindex_provider = 1;
    button_color_chage_provider = !button_color_chage_provider;
    if (button_color_chage_provider = true) {
      button_color_chage2_provider = false;
      button_color_chage3_provider = false;
      button_color_chage4_provider = false;
      buttonpress_provider++;
    }
    notifyListeners();
  }

  changeButtonColor2() {
    markindex_provider = 2;
    button_color_chage2_provider = !button_color_chage2_provider;
    if (button_color_chage2_provider = true) {
      button_color_chage_provider = false;
      button_color_chage3_provider = false;
      button_color_chage4_provider = false;
      buttonpress_provider++;
    }
    notifyListeners();
  }

  changeButtonColor3() {
    markindex_provider = 3;
    button_color_chage3_provider = !button_color_chage3_provider;
    if (button_color_chage3_provider = true) {
      button_color_chage_provider = false;
      button_color_chage2_provider = false;
      button_color_chage4_provider = false;
      buttonpress_provider++;
    }
    notifyListeners();
  }

  changeButtonColor4() {
    markindex_provider = 4;
    button_color_chage4_provider = !button_color_chage4_provider;
    if (button_color_chage3_provider = true) {
      button_color_chage_provider = false;
      button_color_chage2_provider = false;
      button_color_chage3_provider = false;
      buttonpress_provider++;
    }
    notifyListeners();
  }

  restColor() {
    button_color_chage_provider = false;
    button_color_chage2_provider = false;
    button_color_chage3_provider = false;
    button_color_chage4_provider = false;
    buttonIndex=5;
    notifyListeners();
  }

  MarkIngrice() {
    mark_provider++;
    notifyListeners();
  }

  numInedxingrice() {
    num_provider++;
    notifyListeners();
  }
  
  quistonIndexIngrice(){
    questions_Index++;
    notifyListeners();
  }
  

 
  Future<Album> fatchQitunsAPI() async {
    final Response = await http.get(Uri.parse(API1));

    if (Response.statusCode == 200) {
      return Album.fromJson(jsonDecode(Response.body));
    } else {
      throw Exception("Filed to load Album");
    }
  }
  }
  





