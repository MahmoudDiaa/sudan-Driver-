import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/home/cubit/home_cubit.dart';
import '../../layout/home/cubit/home_state.dart';
import '../../shared/components/components.dart';
import '../../shared/components/locale_constant.dart';
import '../../shared/constants.dart';
import '../../shared/style/colors.dart';

class SettingModule extends StatelessWidget {
  const SettingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, state) {
        return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Text(
              language!.general.toUpperCase(),
              style: const TextStyle(fontSize: 18, color: colorText),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: elevatedTextButton(
              function: () {},
              label: language!.profile,
              color: colorText,
              backgroundColor: colorPrimaryDark,
              iconData: Icons.person_outline_rounded,

            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: elevatedTextButton(
              function: () {changeLanguage(context);},
              label: language!.changeLanguage,
              color: colorText,
              backgroundColor: colorPrimaryDark,
              iconData: Icons.language_rounded,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: elevatedTextButton(
              function: () {},
              label: language!.logOut,
              color: colorText,

              backgroundColor: colorPrimaryDark,
              iconData: Icons.logout_rounded,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Text(
              language!.feedback.toUpperCase(),
              style: const TextStyle(fontSize: 18, color: colorText),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
            child: elevatedTextButton(
              function: () {},
              label: language!.reportBug,
              color: colorText,
              backgroundColor: colorPrimaryDark,
              iconData: Icons.bug_report_outlined,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
            child: elevatedTextButton(
              function: () {},
              backgroundColor: colorPrimaryDark,
              label: language!.sendFeedback,
              color: colorText,
              iconData: Icons.send_rounded,
            ),
          ),

        ],
      );
        },
      listener: (BuildContext context, Object? state) {  },

    );
  }
}
