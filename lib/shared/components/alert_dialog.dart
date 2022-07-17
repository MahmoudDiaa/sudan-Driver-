import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;

    const MyAlertDialog({Key? key,
    required this.title,
    required this.content,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
      actions: actions,
      content: content,
    );
  }
}
