import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shake/shake.dart';
import 'package:sudan_driver/shared/bloc_observer.dart';
import 'package:sudan_driver/shared/components/components.dart';
import 'package:sudan_driver/shared/constants.dart';
import 'package:sudan_driver/shared/cubit/cubit.dart';
import 'package:sudan_driver/shared/cubit/state.dart';
import 'package:sudan_driver/shared/network/local/cache_helper.dart';
import 'package:sudan_driver/shared/network/local/shared_pref_const.dart';
import 'package:sudan_driver/shared/network/remote/dio_helper.dart';
import 'package:sudan_driver/shared/style/themes.dart';
import 'background_services/location_background_service.dart';
import 'layout/home/cubit/home_cubit.dart';
import 'layout/login/login_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

LocationBackgroundService _locationBackgroundService =
    LocationBackgroundService();

Future<void> _checkPermission() async {
  final locationPermission = await Permission.location.request();
  if (locationPermission.isDenied || locationPermission.isPermanentlyDenied) {
    openAppSettings();
  }

  final locationAlwaysPermission = await Permission.locationAlways.request();
  if (locationAlwaysPermission.isDenied ||
      locationAlwaysPermission.isPermanentlyDenied) {
    openAppSettings();
  }

  final batteryPermission =
      await Permission.ignoreBatteryOptimizations.request();
  if (batteryPermission.isDenied || batteryPermission.isPermanentlyDenied) {
    openAppSettings();
  }
  if (locationPermission.isDenied ||
      locationPermission.isPermanentlyDenied ||
      batteryPermission.isDenied ||
      batteryPermission.isPermanentlyDenied ||
      locationAlwaysPermission.isDenied ||
      locationAlwaysPermission.isPermanentlyDenied) {
    await _checkPermission();
  } else {
    return;
  }
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding?.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  DioHelper.init();
  await SharedPrefHelper.init();
  await _checkPermission();
  _locationBackgroundService.locationTracking();

  // token = SharedPrefHelper.getData(key: sharedPrefToken);

  BlocOverrides.runZoned(() => runApp(Phoenix(child: const MyApp())),
      blocObserver: MyBlocObserver());

  BackgroundFetch.registerHeadlessTask(
      _locationBackgroundService.backgroundFetchHeadlessTask);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    currentLang =SharedPrefHelper.getData(key: sharedPrefCurrentLang)??'ar';
    debugPrint('current lang $currentLang');
    _locale=Locale(currentLang);
    _locationBackgroundService.initBackgroundService(mounted);
  }

  @override
  Widget build(BuildContext ctx) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppCubit()..initPackageInfo(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
            lazy: true,
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ShakeDetector detector = ShakeDetector.autoStart(
              onPhoneShake: () {
              showToast(message: "SOS  massage Sent", states: ToastStates.WARNING);
                // Do stuff on phone shake
              },
              minimumShakeCount: 1,
              shakeSlopTimeMS: 500,
              shakeCountResetTime: 3000,
              shakeThresholdGravity: 2.7,
            );


            return MaterialApp(
              supportedLocales: AppLocalizations.supportedLocales,
              title: '',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              onGenerateTitle: (ctx) {
                AppCubit.get(context).setLang(ctx);
                return '';
              },
              theme: lightTheme,
              locale: _locale,
              home: const LoginLayout(),
              // AppCubit.get(context).layout,
              debugShowCheckedModeBanner: false,
            );
          },
        ));
  }
}
