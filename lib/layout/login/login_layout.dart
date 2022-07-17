import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:sudan_driver/layout/register/register_layout.dart';
import 'package:sudan_driver/shared/style/colors.dart';
import '../../shared/components/components.dart';
import '../../shared/constants.dart';
import '../home/home_layout.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userNameController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final RoundedLoadingButtonController btnController =
    RoundedLoadingButtonController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        builder: (ctx, state) =>
            Scaffold(
              body: SafeArea(
                  child: Container(
                    color: darkWhite,
                    height: double.infinity,
                    child: AnimationLimiter(
                      child: SizedBox(
                        height: double.infinity,
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max, children: [
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
                                          padding: const EdgeInsets.only(
                                              top: 20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Image.asset(
                                                'assets/logo.png',
                                                scale: 3.5,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Container(
                                    margin: const EdgeInsetsDirectional
                                        .fromSTEB(
                                        20, 240, 20, 20),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 2,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border:
                                        Border.all(
                                            color: Colors.grey.shade200)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: AnimationConfiguration
                                          .toStaggeredList(
                                          delay: const Duration(
                                              milliseconds: 500),
                                          duration: const Duration(
                                              milliseconds: 800),
                                          childAnimationBuilder: (widget) =>
                                              SlideAnimation(
                                                  child: FadeInAnimation(
                                                    child: widget,
                                                  )),
                                          children: [
                                      Form(
                                        key: formKey,
                                        child: Column(
                                        children: [
                                        Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 30, 20, 20),
                                        child: defaultTextFormField(
                                            controller: userNameController,
                                            textInputType: TextInputType.text,
                                            label: language!.userName,
                                            prefix: Icons.person,
                                            validate: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please Entre User Name';
                                              }
                                              return null;
                                            }
                                            ,color: colorText
                                            )

                                          ,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 20),
                                        child: defaultTextFormField(
                                            controller: passwordController,
                                            textInputType: TextInputType.text,
                                            label: language!.password,
                                            validate: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return ' Please Entre Password';
                                              }
                                              return null;
                                            },
                                            prefix: Icons.lock,
                                            suffixIcon: Icons.visibility_off
                                          ,color: colorText
                                        ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 20),
                                        child: RoundedLoadingButton(
                                            color: colorPrimary,
                                            controller: btnController,
                                            onPressed: () {
                                              // if (btnController
                                              //     .currentState !=
                                              //     ButtonState.error) {
                                              //   if (formKey.currentState!
                                              //       .validate()) {
                                              //     LoginCubit.get(ctx).login(
                                              //         userNameController.text,
                                              //         passwordController
                                              //             .text);
                                              //   } else {
                                              //     btnController.stop();
                                              //   }
                                              // } else {
                                              //   btnController.reset();
                                              // }
                                              navigateAndFinish(context, const HomeLayout());
                                            },
                                            child: Text(language!.signIn,style: const TextStyle(color: colorText),)),
                                    ),
                                    Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [

                                          Text(language!.haveNoAccount)
                                    ,
                                    defaultTextButton(
                                          onPress: () {
                                            navigateAndFinish(context, const RegisterLayout());
                                          }
                                          , text: language!.signUp

                                    ),
                                ],
                              )


                            ],
                            ),
                                      )
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
    if (state is LoginSuccessState) {
    showToast(message: state.message, states: ToastStates.SUCCESS);
    btnController.success();
    navigateAndFinish(context, const HomeLayout());
    } else if (state is LoginFailedState) {
    showToast(message: state.error, states: ToastStates.ERROR);

    btnController.error();
    // Timer(const Duration(seconds: 4), () {
    //   btnController.reset();
    // }
    //
    // );
    }
    },
    )
    ,
    );
  }
}
