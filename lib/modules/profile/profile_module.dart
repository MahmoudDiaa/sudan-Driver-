import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:sudan_driver/layout/home/cubit/home_cubit.dart';
import 'package:sudan_driver/layout/home/cubit/home_state.dart';

import '../../shared/components/components.dart';
import '../../shared/constants.dart';
import '../../shared/style/colors.dart';

class ProfileModule extends StatelessWidget {
  const ProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userNameController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final RoundedLoadingButtonController btnController =
    RoundedLoadingButtonController();
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (ctx, state) => Scaffold(
        body: SafeArea(
          child: Container(
            color: darkWhite,
            height: double.infinity,
            child: AnimationLimiter(
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        ShapeOfView(
                          height: 550,
                          elevation: 2,
                          width: double.infinity,
                          shape: ArcShape(
                              direction: ArcDirection.Outside,
                              height: 20,
                              position: ArcPosition.Bottom),
                          child: Container(
                              color: colorPrimary,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/logo.png',
                                      scale: 5,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              20, 120, 20, 20),
                          height: MediaQuery.of(context).size.height / 1.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border:
                              Border.all(color: Colors.grey.shade200)),
                          child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                                delay: const Duration(milliseconds: 500),
                                duration: const Duration(milliseconds: 800),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                        child: FadeInAnimation(
                                          child: widget,
                                        )),
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context)
                                            .size
                                            .height /
                                            2,
                                        child: SingleChildScrollView(
                                          physics:
                                          const BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 10, 20, 10),
                                                child: defaultTextFormField(
                                                    controller:
                                                    userNameController,
                                                    textInputType:
                                                    TextInputType.name,
                                                    label: language!.userName,
                                                    prefix: Icons.person,
                                                    validate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Entre${language!.userName}';
                                                      }
                                                      return null;
                                                    },color: colorText),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 10, 20, 10),
                                                child: defaultTextFormField(
                                                    controller:
                                                    userNameController,
                                                    textInputType:
                                                    TextInputType.number,
                                                    label: language!
                                                        .ownerProfileNo,
                                                    prefix: Icons
                                                        .confirmation_num_rounded,
                                                    validate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Entre ${language!.ownerProfileNo}';
                                                      }
                                                      return null;
                                                    }
                                                    ,color: colorText
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 10, 20, 10),
                                                child: defaultTextFormField(
                                                    controller:
                                                    userNameController,
                                                    textInputType:
                                                    TextInputType.number,
                                                    label:
                                                    language!.passportNo,
                                                    prefix: FontAwesomeIcons
                                                        .passport,
                                                    validate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Entre${language!.passportNo}';
                                                      }
                                                      return null;
                                                    },color: colorText),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 10, 20, 10),
                                                child: defaultTextFormField(
                                                    controller:
                                                    userNameController,
                                                    textInputType:
                                                    TextInputType.phone,
                                                    label: language!.phone,
                                                    prefix:
                                                    Icons.contact_phone,
                                                    validate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Entre${language!.phone}';
                                                      }
                                                      return null;
                                                    },color: colorText),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 10, 20, 10),
                                                child: defaultTextFormField(
                                                    controller:
                                                    userNameController,
                                                    textInputType:
                                                    TextInputType.number,
                                                    label:
                                                    language!.licenseNo,
                                                    prefix: FontAwesomeIcons
                                                        .idBadge,
                                                    suffixIcon: FontAwesomeIcons.camera,
                                                    validate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Entre${language!.licenseNo}';
                                                      }
                                                      return null;
                                                    },color: colorText),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 0, 20, 20),
                                                child: defaultTextFormField(
                                                    controller:
                                                    passwordController,
                                                    textInputType:
                                                    TextInputType.text,
                                                    label: language!.password,
                                                    validate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return ' Please Entre Password';
                                                      }
                                                      return null;
                                                    },color: colorText,
                                                    prefix: Icons.lock,
                                                    suffixIcon:
                                                    Icons.visibility_off),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      divider(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10)),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: FloatingActionButton(
                                              onPressed: () {},
                                              backgroundColor: colorPrimary,
                                              child: const Icon(
                                                FontAwesomeIcons.idCard,color: colorText,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FloatingActionButton(
                                              onPressed: () {},
                                              backgroundColor: colorPrimary,
                                              child: const Icon(
                                                FontAwesomeIcons.carSide,color: colorText,
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            child: FloatingActionButton(
                                              onPressed: () {},
                                              backgroundColor: colorPrimary,
                                              child: const Icon(
                                                FontAwesomeIcons.car,color: colorText,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FloatingActionButton(
                                              onPressed: () {},
                                              backgroundColor: colorPrimary,
                                              child: const Icon(
                                                FontAwesomeIcons.person,color: colorText,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                ]),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
      listener: (BuildContext context, state) {

      },
    );
  }
}
