import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sudan_driver/modules/profile/profile_module.dart';
import 'package:sudan_driver/modules/setting/setting_module.dart';

import '../../../modules/home/home_module.dart';
import '../../../shared/constants.dart';
import '../../../shared/components/locale_constant.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStatesInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final List<MenuItem> drawerMenuItems = [];

  bool isBottomNav = true;

  int currentIndex = 0;
  List<Widget> screens = [const HomeModule(), const ProfileModule(), const SettingModule()];

  List<String>? title;

  setTitles() {
    title = [
      language!.home.toUpperCase(),
      language!.profile.toUpperCase(),
      language!.setting.toUpperCase(),
    ];
  }

  changeBottomNav(int position) {
    currentIndex = position;
    emit(BottomNavigationChangeState());
  }

  // List<HomeContentModel> homeContent = [];

  void changeLang(BuildContext context) {
    changeLanguage(context);
    emit(LanguageChangeState());
  }

  List<XFile> images = [];

  void captureImage() async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera);
    images.add(image!);
    emit(CaptureImageState());
  }

  void deleteImage(int index) {
    if (images.isNotEmpty) {
      images.removeAt(index);
      emit(DeleteImageState());
    }
  }

  final Completer<GoogleMapController> _controller = Completer();

  void onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
      emit(MapCreatedState());
    }

  }
}
