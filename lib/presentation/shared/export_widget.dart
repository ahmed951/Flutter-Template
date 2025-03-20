import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:template/presentation/shared/spaces.dart';

import '../../constants/text_styles.dart';

class ExportWidget extends StatelessWidget {
  const ExportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Export as".tr(), style: CustomTextStyle().black24w700),
        horizontalSpace(5.w),
        Transform.scale(
          scale: 1.3,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/export_doc.png",
              width: 20.w,
              height: 20.w,
            ),
          ),
        ),
        horizontalSpace(1.w),
        Transform.scale(
          scale: 1.3,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/export_csv.png",
              width: 20.w,
              height: 20.w,
            ),
          ),
        ),
        horizontalSpace(1.w),
        Transform.scale(
          scale: 1.3,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/export_pdf.png",
              width: 20.w,
              height: 20.w,
            ),
          ),
        ),
      ],
    );
  }
}
