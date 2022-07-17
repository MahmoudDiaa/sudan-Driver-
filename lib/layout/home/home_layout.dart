import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/constants.dart';
import '../../shared/style/colors.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (ctx, state) {
        var cubit = HomeCubit.get(ctx);
        cubit.setTitles();

        return Directionality(
          textDirection: language!.localeName == 'en'
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              elevation: 3.0,
              centerTitle: true,
              title: Text(
                cubit.title![cubit.currentIndex],
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                maxLines: 1,
                softWrap: true,
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: ConvexAppBar(
              activeColor: Colors.black,
              backgroundColor: colorPrimary,
              elevation: 10,
              disableDefaultTabController: true,
              items: [
                TabItem(
                  icon: Icons.home,
                  title: language?.home,
                ),
                TabItem(
                    icon: Icons.person,
                    title: language!.profile,
                    isIconBlend: true),
                TabItem(icon: Icons.settings, title: language!.setting),
              ],
              height: 55,
              initialActiveIndex: 0,
              onTap: (position) => cubit.changeBottomNav(position),
              style: TabStyle.custom,
            ),
          ),
        );
      },
    );
  }
}
