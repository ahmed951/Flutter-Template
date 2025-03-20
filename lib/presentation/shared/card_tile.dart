import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/text_styles.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.cubit,
    required this.title,
    required this.data,
    this.isPrice = false,
    this.shouldNotBeSelected = false,
  });
  final dynamic cubit;
  final String title;
  final String data;
  final bool shouldNotBeSelected;
  final bool isPrice;

  Map<String, Color> getStatusColor() {
    if (data == "Deactivated".tr() || data.contains("Rejected".tr())) {
      return {
        "bgColor": Colors.red.withOpacity(0.3),
        "textColor": Colors.red,
      };
    } else if (data == "Active".tr() || data == "Accepted".tr()) {
      return {
        "bgColor": Colors.green.withOpacity(0.3),
        "textColor": Colors.green,
      };
    } else if (data == "Draft".tr()) {
      return {
        "bgColor": Colors.blue.withOpacity(0.3),
        "textColor": Colors.blue,
      };
    } else if (data == "Ready".tr() ||
        data == "In Progress".tr() ||
        data == "Cancelled".tr()) {
      return {
        "bgColor": Colors.orange.withOpacity(0.3),
        "textColor": Colors.orange,
      };
    } else if (data == "Synced".tr() || data == "Placed".tr()) {
      return {
        "bgColor": Colors.yellow.withOpacity(0.3),
        "textColor": Colors.yellow,
      };
    } else if (data == "Waiting for salesman approval".tr()) {
      return {
        "bgColor": Colors.indigo.withOpacity(0.3),
        "textColor": Colors.indigo,
      };
    } else {
      return {
        "bgColor": Colors.green.withOpacity(0.3),
        "textColor": Colors.green,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    if (title != "Image" &&
        title != "Id" &&
        (cubit.selectedItems.contains(title) || shouldNotBeSelected)) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Row(
          children: [
            Text(
              title.tr(),
              style: CustomTextStyle().grey16w600,
            ),
            const Spacer(),
            if (title == "Status")
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: getStatusColor()["bgColor"],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  data,
                  style: CustomTextStyle().black16w500.copyWith(
                        color: getStatusColor()["textColor"],
                      ),
                ),
              )
            else
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 50.w),
                child: Text(
                  data + (isPrice ? " \$" : ""),
                  style: CustomTextStyle().black16w500.copyWith(
                        fontFamily: isPrice ? 'Riyal' : null,
                      ),
                  textAlign: TextAlign.end,
                  //overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
