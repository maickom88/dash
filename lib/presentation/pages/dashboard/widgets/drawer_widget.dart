import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import 'widgets.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        DrawerHeader(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(PathImagesConst.logo),
          ),
        ),
        ListTile(
          selected: true,
          horizontalTitleGap: 0.0,
          leading: Icon(
            Icons.dashboard,
            size: Get.height.percent(4),
          ),
          title: Container(
            width: double.infinity,
            height: Get.height.percent(8),
            child: AutoSizeText(
              "Painel",
              maxFontSize: 100,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(fontSize: 100),
            ),
          ),
          onTap: () {},
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Copyright © 2021 Dash Todos os direitos reservados",
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12),
          ),
        )
      ],
    );
  }
}
