import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

import '../../constants/text_styles.dart';

class DefaultBreadCrumb extends StatelessWidget {
  const DefaultBreadCrumb({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return BreadCrumb(
      items: <BreadCrumbItem>[
        for (String item in items)
          BreadCrumbItem(
            content: Text(
              item,
              style: (item == items[items.length - 1])
                  ? CustomTextStyle().breadcrumbActive
                  : CustomTextStyle().breadcrumbInactive,
            ),
          ),
      ],
      divider: const Icon(Icons.chevron_right),
    );
  }
}
