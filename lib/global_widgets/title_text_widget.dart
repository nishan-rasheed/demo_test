import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_text_styles.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Text(title,style: AppTextStyles.titleHedingStyle),
    );
  }
}