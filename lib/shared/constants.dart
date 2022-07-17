import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void signOut(
  context,
) {
  // SharedPrefHelper.clearData(key: sharedPrefToken).then((value) {
  //   if (value) {
  //     navigateAndFinish(context, const LoginLayout());
  //   }
  // });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) => debugPrint(element.group(0)));
}

String token = '';
String uId = '';
String currentLang = '';
AppLocalizations? language;

PackageInfo packageInfo = PackageInfo(
  appName: 'Unknown',
  packageName: 'Unknown',
  version: 'Unknown',
  buildNumber: 'Unknown',
  buildSignature: 'Unknown',
);
