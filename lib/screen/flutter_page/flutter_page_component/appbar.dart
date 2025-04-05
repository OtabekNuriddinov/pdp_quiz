import 'package:flutter/material.dart';

import '../../../core/theme/icons.dart';

AppBar customAppBar(BuildContext context) {
  _back() {
    Navigator.pop(context);
  }

  return AppBar(
    backgroundColor: Colors.black12,
    leading: GestureDetector(
      onTap: _back,
      child: Align(
        alignment: Alignment(1, -0.7),
        child: Row(
          spacing: 4,
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.arrow_back_rounded),
            Text(
              "Back",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ],
        ),
      ),
    ),
    leadingWidth: 90,
    centerTitle: true,
    title: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 24,
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: AppIcons.littleFlutter,
        ),
        Text(
          "Flutter",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    ),
    toolbarHeight: 200,
  );
}
