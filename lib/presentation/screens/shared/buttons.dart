import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

import '../../../constants/text_styles.dart';

Widget defaultButton({text, func, expanded = true, height}) => SizedBox(
      width: expanded ? double.infinity : null,
      height: height ?? 50,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(mainColor)),
        onPressed: func,
        child: Text(
          text,
          style: CustomTextStyle().white20w600,
        ),
      ),
    );

Widget defaultGradientButton({
  required text,
  required func,
  expanded = true,
  enabled = true,
}) =>
    Container(
      width: expanded ? double.infinity : null,
      height: 50,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: enabled ? null : Colors.white,
        gradient: enabled
            ? const LinearGradient(
                colors: [Color(0xff065580), Color(0xff013856)],
              )
            : null,
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(side: BorderSide(color: mainColor)),
        onPressed: func,
        child: Text(
          text,
          style: enabled
              ? CustomTextStyle().white16w500
              : CustomTextStyle().main16w500,
        ),
      ),
    );

Widget defaultWhiteButton(
        {required text,
        required func,
        expanded = true,
        enabled = true,
        height}) =>
    Container(
      width: expanded ? double.infinity : null,
      height: height ?? 60,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: mainColor,
      ),
      child: ElevatedButton(
        /* materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: Colors.white,
        shape: const StadiumBorder(side: BorderSide(color: mainColor)), */
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        onPressed: func,
        child: Text(
          text,
          style: enabled
              ? CustomTextStyle().main16w500
              : CustomTextStyle().main16w500,
        ),
      ),
    );

Widget defaultTextButton(
        {required func,
        required text,
        color = mainColor,
        isUnderline = false,
        isBold = false}) =>
    TextButton(
        onPressed: func,
        child: Padding(
          padding: EdgeInsets.only(top: isUnderline ? 10.0 : 0),
          child: Text(
            text,
            style: TextStyle(
              color: isUnderline ? Colors.transparent : color,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: mainColor.withOpacity(
                0.5,
              ),
              shadows: isUnderline
                  ? const [Shadow(color: mainColor, offset: Offset(0, -7))]
                  : null,
              decorationThickness: 3,
            ),
          ),
        ));
Widget defaultTextButtonWithIcon({
  required VoidCallback func,
  required text,
  color = mainColor,
  isUnderline = false,
  isBold = false,
  required icon,
  size = 16.0,
  TextDirection direction = TextDirection.rtl,
}) =>
    Directionality(
      textDirection: direction,
      child: TextButton.icon(
          onPressed: func,
          icon: Icon(
            icon,
            color: color,
            size: size,
          ),
          label: Text(
            text,
            style: TextStyle(
              color: isUnderline ? Colors.transparent : color,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: mainColor.withOpacity(
                0.5,
              ),
              shadows: isUnderline
                  ? const [Shadow(color: mainColor, offset: Offset(0, -7))]
                  : null,
              decorationThickness: 2,
            ),
          )),
    );
