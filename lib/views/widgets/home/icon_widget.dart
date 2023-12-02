import 'package:flutter/material.dart';

import '../../../core/colors.dart';

Widget iconWidget({IconData? icon, double? size, double rPadding = 10}) {
  return Padding(
    padding: EdgeInsets.only(right: rPadding),
    child: Icon(
      icon,
      color: AppColors.blackColor,
      size: size,
    ),
  );
}
