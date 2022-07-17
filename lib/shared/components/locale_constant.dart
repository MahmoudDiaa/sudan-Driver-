import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sudan_driver/layout/login/login_layout.dart';
import 'package:sudan_driver/shared/components/components.dart';

import '../../main.dart';
import '../constants.dart';
import '../network/local/cache_helper.dart';
import '../network/local/shared_pref_const.dart';


void changeLanguage(BuildContext context)  {
  debugPrint("before lang is ${language!.localeName}");
  var locale = language!.localeName == 'ar'
      ? const Locale('en')
      :  const Locale('ar');
  SharedPrefHelper.saveData(key: sharedPrefCurrentLang,value: locale.languageCode);
  debugPrint("before lang is ${locale.languageCode}");
  MyApp.setLocale(context,  locale);
  Phoenix.rebirth( context);
}
