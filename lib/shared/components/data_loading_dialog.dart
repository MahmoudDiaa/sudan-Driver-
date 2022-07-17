import 'package:flutter/material.dart';

class DataLoadingDialog extends StatelessWidget {
  final List<Widget> widgetList;

   const DataLoadingDialog({Key? key, this.widgetList = const []}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widgetList,
    );
  }
}
