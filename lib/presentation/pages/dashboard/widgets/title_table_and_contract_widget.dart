import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class TitleTableAndContractWidget extends StatelessWidget {
  const TitleTableAndContractWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: AutoSizeText(
            "Monitoramento Remoto - IGESDF",
            maxLines: 1,
            minFontSize: 16,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                color: Colors.white,
                fontSize: Responsive.isMobile(context) ? 32 : 100),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Flexible(
          child: AutoSizeText(
            "Contrato: 088/2019",
            maxLines: 1,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                color: Colors.white,
                fontSize: Responsive.isMobile(context) ? 30 : 100),
          ),
        ),
      ],
    );
  }
}
