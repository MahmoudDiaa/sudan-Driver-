import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../style/colors.dart';
import '../style/icon_broken.dart';

Widget defaultButton(
        {double width = double.infinity,
        Color background = colorPrimary,
        double height = 50,
        required VoidCallback? function,
        required String text}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: background),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultTextButton(
        {required VoidCallback? onPress, required String text}) =>
    TextButton(
      onPressed: onPress,
      child: Text(text.toUpperCase(),
          style:
              const TextStyle(color: colorText, fontWeight: FontWeight.bold)),
    );

Widget defaultTextFormField(
        {required TextEditingController controller,
        required TextInputType textInputType,
        GlobalKey<FormState>? key,
        ValueChanged? onSubmit,
        ValueChanged? onChanged,
        FormFieldValidator? validate,
        required String label,
        required IconData prefix,
        bool obscure = false,
        VoidCallback? onTab,
        IconData? suffixIcon,
        bool isClickable = true,
        VoidCallback? onPressSuffix,
        TextInputAction textInputAction = TextInputAction.next,
        Color color = colorPrimary}) =>
    TextFormField(
      key: key,
      controller: controller,
      keyboardType: textInputType,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      obscureText: obscure,
      onTap: onTab,
      cursorColor: color,
      textInputAction: textInputAction,
      enabled: isClickable,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: color),
          labelText: label,
          focusColor: color,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: color)),
          hoverColor: color,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(
            prefix,
            color: color,
          ),
          suffixIcon: IconButton(
            onPressed: onPressSuffix,
            icon: Icon(
              suffixIcon,
              color: color,
            ),
          )),
      style: const TextStyle(fontSize: 20.0, color: Colors.black),
    );

Widget buildTaskItem({required Map model, required BuildContext context}) =>
    Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        // AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model['time']}'),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                // AppCubit.get(context)
                //     .updateData(status: 'done', id: model['id']);
              },
              icon: const Icon(Icons.check_box_rounded, color: Colors.green),
              iconSize: 30.0,
            ),
            IconButton(
              onPressed: () {
                // AppCubit.get(context)
                //     .updateData(status: 'archive', id: model['id']);
              },
              icon: const Icon(Icons.archive_rounded, color: Colors.red),
              iconSize: 30.0,
            )
          ],
        ),
      ),
    );

Widget buildArticleItem(
        {required Map<String, dynamic> article,
        required context,
        required int index}) =>
    InkWell(
      onTap: () {
        // navigateTo(context, WebViewScreen(url: article['url']));
        // NewsCubit.get(context).selectBusinessItem(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget divider({padding = const EdgeInsets.all(10)}) => Padding(
      padding: padding,
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItem(
              article: list[index], context: context, index: index),
          separatorBuilder: (context, index) => divider(),
          itemCount: list.length),
      fallback: (context) => Center(
        child: isSearch ? Container() : const CircularProgressIndicator(),
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void showToast({required String message, required ToastStates states}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(states));

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates states) {
  switch (states) {
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.amber;
  }
}

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      titleSpacing: 5,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconBroken.arrowLeft_2)),
      title: Text(title!),
      actions: actions,
    );

Widget elevatedTextButton({
  required String label,
  required Color color,
  required VoidCallback function,
  required IconData iconData,
  Color backgroundColor = Colors.white,
}) =>
    ElevatedButton.icon(
        onPressed: function,
        clipBehavior: Clip.antiAlias,
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 60)),
          elevation: MaterialStateProperty.all(2),
          alignment: AlignmentDirectional.centerStart,
          backgroundColor: MaterialStateProperty.all(backgroundColor.withOpacity(0.9)),
        ),
        label: Row(
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(fontSize: 15, color: color),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: color,
            )
          ],
        ),
        icon: Icon(
          iconData,
          size: 30,
          color: color,
        ));
