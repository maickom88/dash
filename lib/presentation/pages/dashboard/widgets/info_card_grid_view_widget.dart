import 'package:auto_size_text/auto_size_text.dart';
import 'package:dash/data/models/cards_resume_models.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class InfoCardGridView extends StatelessWidget {
  const InfoCardGridView({
    Key? key,
    required this.list,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.6,
    this.heightText = 0.3,
    this.sizeText = 100,
  }) : super(key: key);

  final List<CardsResumeModels> list;
  final int crossAxisCount;
  final double childAspectRatio;
  final double heightText;
  final double sizeText;

  @override
  Widget build(BuildContext context) {
    final group = AutoSizeGroup();
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Layout.defaultGridSpacer,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: Layout.defaultGridSpacer,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: list.length,
      itemBuilder: (_, index) => Container(
        padding: EdgeInsets.all(Layout.defaultPadding * 0.75),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Layout.defaultBorderRadius),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    list[index].number,
                    maxLines: 1,
                    group: group,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: Colors.white,
                          fontSize: sizeText,
                        ),
                  ),
                  AutoSizeText(
                    list[index].name,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(height: heightText, fontSize: 13),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                child: Image.asset(
                  list[index].icon,
                  color: Colors.white.withOpacity(0.2),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
