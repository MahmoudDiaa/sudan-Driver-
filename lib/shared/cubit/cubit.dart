import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sudan_driver/shared/cubit/state.dart';

import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Widget layout = const Scaffold(body: Center(

    child: CircularProgressIndicator(),
  ),);


  void setLang(BuildContext context){

    language =AppLocalizations.of(context)!;
    debugPrint("initStates ${AppLocalizations.of(context)!.localeName}");
    FlutterNativeSplash.remove();
  }

  void initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    packageInfo = info;
  }
}
