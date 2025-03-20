import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';

Future<dynamic> deleteDialog(BuildContext context,
    {required String type, required func}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Delete $type".tr(),
          style: CustomTextStyle().black16w500,
        ),
        content: Text(
          "Are you sure you want to delete this $type?".tr(),
          style: CustomTextStyle().black16w500,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel".tr(),
              style: CustomTextStyle().black16w500,
            ),
          ),
          TextButton(
            onPressed: () {
              func();
              Navigator.pop(context);
            },
            child: Text(
              "Delete".tr(),
              style: CustomTextStyle().black16w500,
            ),
          ),
        ],
      );
    },
  );
}

Future<dynamic> defaultGeneralDialog(BuildContext context,
    {required String title,
    required String content,
    String button = "Confirm",
    required func}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: CustomTextStyle().black16w500,
        ),
        content: Text(
          content,
          style: CustomTextStyle().black16w500,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel".tr(),
              style: CustomTextStyle().black16w500,
            ),
          ),
          TextButton(
            onPressed: () {
              func();
              Navigator.pop(context);
            },
            child: Text(
              button,
              style: CustomTextStyle().black16w500,
            ),
          ),
        ],
      );
    },
  );
}
