import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/utils/utils.dart';

class HeaderPanelWidget extends StatelessWidget {
  const HeaderPanelWidget({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })   : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(Icons.menu, color: Colors.white),
          ),
        ),
        if (!Responsive.isMobile(context))
          Flexible(
            child: AutoSizeText(
              "Painel Administrativo",
              maxLines: 1,
              maxFontSize: 100,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Colors.white,
                    fontSize: 50,
                  ),
            ),
          ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: Layout.defaultPadding,
          ),
          width: Responsive.isMobile(context)
              ? Get.width.percent(60)
              : Get.width.percent(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  PathImagesConst.avatar,
                ),
              ),
              withSpaceWidth(),
              Flexible(
                child: AutoSizeText(
                  "Fulano de tal",
                  maxLines: 1,
                  maxFontSize: 50,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: Responsive.isMobile(context) ? 13 : 50),
                ),
              ),
              DropdownButton<String>(
                onChanged: (change) {},
                underline: SizedBox(),
                icon: Icon(Icons.more_vert),
                onTap: () {},
                items: ["Sair"]
                    .map((e) => DropdownMenuItem<String>(
                          child: Text(e),
                        ))
                    .toList(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
