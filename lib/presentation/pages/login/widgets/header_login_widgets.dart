import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/utils/responsive_util.dart';

class HeaderLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Layout.defaultPadding),
      width: Responsive.isMobile(context)
          ? Get.width.percent(20)
          : Get.width.percent(5),
      height: Responsive.isMobile(context)
          ? Get.width.percent(20)
          : Get.width.percent(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: Layout.defaultBoxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          PathImagesConst.logo,
        ),
      ),
    );
  }
}
