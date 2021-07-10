import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/responsive_util.dart';

class HeaderTableWidget extends StatelessWidget {
  final String title;
  final Function(String) onSearch;
  const HeaderTableWidget({
    Key? key,
    required this.title,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: AutoSizeText(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Colors.white,
                fontSize: Responsive.isMobile(context) ? 32 : 50),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextFormField(
            onChanged: (value) => onSearch(value),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 12,
              ),
              hintText: "Pesquisar",
              fillColor: Colors.white.withOpacity(0.1),
            ),
          ),
        )
      ],
    );
  }
}
