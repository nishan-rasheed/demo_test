import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class RoundButtonWidget extends StatelessWidget {
   RoundButtonWidget({
    super.key, required this.color,
    this.iconColor = AppColor.whiteColor
  });

  final Color color;
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:color,
      child: Icon(Icons.shopping_bag_outlined,color: iconColor),
    );
  }
}