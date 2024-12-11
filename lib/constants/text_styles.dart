import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:template/constants/colors.dart';

abstract class CustomTextStyle {
  get lightBlack24w700;
  get lightBlack20w600;
  get grey10w400;
  get grey20w600;
  get grey16w600;
  get grey14w400;
  get grey12w400;
  get grey20w400;
  get grey28w700;
  get grey32w700;
  get white14;
  get white16w900;
  get white16w400;
  get white16w500;
  get white24w500;
  get white20w700;
  get main16w900;
  get main20w500;
  get main14w500;
  get main14w600;
  get main14w400;
  get main14w500op7;
  get main16w500op7;
  get main16w500;
  get main16w700;
  get main20w700;
  get hintTextStyle;
  get red14;
  get main14w400op5;
  get main16w400op5;
  get main16w400op2;
  get main20w500op5;
  get main26w400;
  get main26w500op5;
  get main32w700;
  get main28w700;
  get main32w500;
  get blue14w500;
  get black12w400;
  get black14w400;
  get black16w600;
  get black16w500;
  get black24w700;
  get black14w600;
  get white20w600;
  get green16w400;
  factory CustomTextStyle() {
    return CustomTextStyleMedium();

    /* switch (currentFontSize) {
      case AppFontSize.medium:
        return CustomTextStyleMedium();
      case AppFontSize.large:
        return CustomTextStyleLarge();
      default:
        return CustomTextStyleMedium();
    } */
  }
}

class CustomTextStyleMedium implements CustomTextStyle {
  @override
  get lightBlack24w700 => const TextStyle(
      color: lightBlackColor, fontSize: 24, fontWeight: FontWeight.w700);
  @override
  get lightBlack20w600 => const TextStyle(
      color: lightBlackColor, fontSize: 20, fontWeight: FontWeight.w600);
  @override
  get grey10w400 => const TextStyle(
      color: greyColor, fontSize: 10, fontWeight: FontWeight.w400);
  @override
  get grey16w600 => const TextStyle(
      color: greyColor, fontSize: 16, fontWeight: FontWeight.w600);
  @override
  get grey14w400 => const TextStyle(
      color: greyColor, fontSize: 14, fontWeight: FontWeight.w400);
  @override
  get grey12w400 => const TextStyle(
      color: greyColor, fontSize: 12, fontWeight: FontWeight.w400);
  @override
  get grey20w600 => const TextStyle(
      color: greyColor, fontSize: 20, fontWeight: FontWeight.w600);
  @override
  get grey32w700 => const TextStyle(
      color: greyColor, fontSize: 32, fontWeight: FontWeight.w700);
  @override
  get grey28w700 => const TextStyle(
      color: greyColor, fontSize: 28, fontWeight: FontWeight.w700);
  @override
  get grey20w400 => const TextStyle(
      color: greyColor, fontSize: 20, fontWeight: FontWeight.w500);
  @override
  get white14 => const TextStyle(color: Colors.white, fontSize: 14);
  @override
  get white16w400 => const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);
  @override
  get white16w500 => const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
  @override
  get white24w500 => const TextStyle(
      color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500);
  @override
  get white20w600 => TextStyle(
      color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w600);
  @override
  get white16w900 => const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900);
  @override
  get white20w700 => const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700);
  @override
  get main16w900 => const TextStyle(
      color: mainColor, fontSize: 16, fontWeight: FontWeight.w900);
  @override
  get main20w500 => const TextStyle(
      color: mainColor, fontSize: 20, fontWeight: FontWeight.w500);
  @override
  get main14w500 => const TextStyle(
      color: mainColor, fontSize: 14, fontWeight: FontWeight.w500);
  @override
  get main14w600 => const TextStyle(
      color: mainColor, fontSize: 14, fontWeight: FontWeight.w600);
  @override
  get main14w400 => const TextStyle(
      color: mainColor, fontSize: 14, fontWeight: FontWeight.w400);
  @override
  get main14w500op7 => TextStyle(
      color: mainColor.withOpacity(0.7),
      fontSize: 14,
      fontWeight: FontWeight.w500);
  @override
  get main16w500op7 => TextStyle(
      color: mainColor.withOpacity(0.7),
      fontSize: 16,
      fontWeight: FontWeight.w500);
  @override
  get main16w500 => const TextStyle(
      color: mainColor, fontSize: 16, fontWeight: FontWeight.w500);
  @override
  get main28w700 => const TextStyle(
      color: mainColor, fontSize: 28, fontWeight: FontWeight.w700);
  @override
  get main16w700 => const TextStyle(
      color: mainColor, fontSize: 16, fontWeight: FontWeight.w700);
  @override
  get main20w700 => const TextStyle(
      color: mainColor, fontSize: 20, fontWeight: FontWeight.w700);

  @override
  get hintTextStyle => const TextStyle(
      color: greyColor, fontSize: 16, fontWeight: FontWeight.w500);
  @override
  get red14 => const TextStyle(
        color: Color(0xffe45757),
        fontSize: 14,
      );
  @override
  get main14w400op5 => TextStyle(
      color: mainColor.withOpacity(0.5),
      fontSize: 14,
      fontWeight: FontWeight.w400);
  @override
  get main16w400op5 => TextStyle(
      color: mainColor.withOpacity(0.5),
      fontSize: 16,
      fontWeight: FontWeight.w400);
  @override
  get main16w400op2 => TextStyle(
      color: mainColor.withOpacity(0.2),
      fontSize: 16,
      fontWeight: FontWeight.w400);
  @override
  get main20w500op5 => TextStyle(
      color: mainColor.withOpacity(0.5),
      fontSize: 20,
      fontWeight: FontWeight.w500);
  @override
  get main26w400 => const TextStyle(
      color: mainColor, fontSize: 26, fontWeight: FontWeight.w400);
  @override
  get main26w500op5 => TextStyle(
      color: mainColor.withOpacity(0.5),
      fontSize: 26,
      fontWeight: FontWeight.w500);
  @override
  get main32w700 => const TextStyle(
      color: mainColor, fontSize: 32, fontWeight: FontWeight.w700);
  @override
  get main32w500 => const TextStyle(
      color: mainColor, fontSize: 32, fontWeight: FontWeight.w500);

  @override
  get blue14w500 => const TextStyle(
      color: lightBlueColor, fontSize: 14, fontWeight: FontWeight.w500);
  @override
  get black12w400 => const TextStyle(
      color: blackColor, fontSize: 12, fontWeight: FontWeight.w400);
  @override
  get black14w400 => const TextStyle(
      color: blackColor, fontSize: 14, fontWeight: FontWeight.w400);
  @override
  get black16w600 => const TextStyle(
      color: blackColor, fontSize: 16, fontWeight: FontWeight.w600);
  @override
  get black16w500 => const TextStyle(
      color: blackColor, fontSize: 16, fontWeight: FontWeight.w500);
  @override
  get black14w600 => const TextStyle(
      color: blackColor, fontSize: 14, fontWeight: FontWeight.w600);
  @override
  get black24w700 => const TextStyle(
      color: blackColor, fontSize: 24, fontWeight: FontWeight.w700);
  @override
  get green16w400 => const TextStyle(
      color: Colors.green, fontSize: 16, fontWeight: FontWeight.w400);
}

/* class CustomTextStyleLarge implements CustomTextStyle {
  @override
  get white14 => const TextStyle(color: Colors.white, fontSize: 16);
  @override
  get white16w400 => const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400);
  @override
  get white16w500 => const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
  @override
  get white24w500 => const TextStyle(
      color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500);
  @override
  get white16w900 => const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900);
  @override
  get white20w700 => const TextStyle(
      color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700);
  @override
  get main16w900 => const TextStyle(
      color: mainColor, fontSize: 20, fontWeight: FontWeight.w900);
  @override
  get main20w500 => const TextStyle(
      color: mainColor, fontSize: 22, fontWeight: FontWeight.w500);
  @override
  get main14w500 => const TextStyle(
      color: mainColor, fontSize: 16, fontWeight: FontWeight.w500);
  @override
  get main14w400 => const TextStyle(
      color: mainColor, fontSize: 16, fontWeight: FontWeight.w400);
  @override
  get main14w500op7 => TextStyle(
      color: mainColor.withOpacity(0.7),
      fontSize: 16,
      fontWeight: FontWeight.w500);
  @override
  get main16w500op7 => TextStyle(
      color: mainColor.withOpacity(0.7),
      fontSize: 18,
      fontWeight: FontWeight.w500);
  @override
  get main16w500 => const TextStyle(
      color: mainColor, fontSize: 18, fontWeight: FontWeight.w500);
  @override
  get main16w700 => const TextStyle(
      color: mainColor, fontSize: 18, fontWeight: FontWeight.w700);
  @override
  get main20w700 => const TextStyle(
      color: mainColor, fontSize: 22, fontWeight: FontWeight.w700);

  @override
  get hintTextStyle => TextStyle(
        color: mainColor.withOpacity(0.5),
        fontSize: 16,
      );
  @override
  get red14 => const TextStyle(
        color: Color(0xffe45757),
        fontSize: 16,
      );
  @override
  get main14w400op5 => TextStyle(
      color: mainColor.withOpacity(0.5),
      fontSize: 16,
      fontWeight: FontWeight.w400);
  @override
  get main16w400op5 => TextStyle(
      color: mainColor.withOpacity(0.5),
      fontSize: 18,
      fontWeight: FontWeight.w400);
  @override
  get main16w400op2 => TextStyle(
      color: mainColor.withOpacity(0.2),
      fontSize: 18,
      fontWeight: FontWeight.w400);
  @override
  get main20w500op5 => TextStyle(
      color: mainColor.withOpacity(0.5),
      fontSize: 22,
      fontWeight: FontWeight.w500);
  @override
  get main26w400 => const TextStyle(
      color: mainColor, fontSize: 28, fontWeight: FontWeight.w400);
  @override
  get main26w500op5 => TextStyle(
      color: mainColor.withOpacity(0.5),
      fontSize: 28,
      fontWeight: FontWeight.w500);
  @override
  get main32w700 => const TextStyle(
      color: mainColor, fontSize: 36, fontWeight: FontWeight.w700);

  @override
  get main32w500 => const TextStyle(
      color: mainColor, fontSize: 36, fontWeight: FontWeight.w500);
  @override
  get blue14w500 => const TextStyle(
      color: lightBlueColor, fontSize: 16, fontWeight: FontWeight.w500);
  @override
  get black12w400 => const TextStyle(
      color: blackColor, fontSize: 14, fontWeight: FontWeight.w400);
}
 */