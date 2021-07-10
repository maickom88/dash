import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constants.dart';

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
          ),
          title: Text(
            "Painel",
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
