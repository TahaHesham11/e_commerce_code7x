import 'dart:convert';
import 'package:flutter/services.dart';

abstract class Config{

 static Map Localization = {};

  static loadLanguage(String lang)async{

    String Translation;
    if(lang =='ar'){
      Translation = await rootBundle.loadString('assets/localization/ar.json');

    }else{
      Translation = await rootBundle.loadString('assets/localization/en.json');

    }
    Localization = jsonDecode(Translation);
  }
}