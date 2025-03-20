import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

import '../../constants/text_styles.dart';
//import 'dart:ui' as ui;

Widget defaultFormField(context,
    {required TextEditingController controller,
    required TextInputType type,
    Function? onSubmit,
    ValueSetter<String>? onChange,
    var onTap,
    bool isPassword = false,
    required validate,
    String? label,
    IconData? prefix,
    IconData? suffix,
    Widget? suffixWidget,
    var suffixPressed,
    bool isClickable = true,
    bool readOnly = false,
    int minLine = 1,
    int maxLine = 1,
    double padding = 30,
    double suffixSize = 25,
    bool showBorder = true,
    double borderRadius = 5,
    String? hint,
    bool isRTL = false,
    bool paddingBottom = true,
    Color? iconColor,
    Color? borderColor,
    Color? fillColor,
    Color? textColor,
    double? borderWidth,
    bool isRequired = false,
    bool isPrice = false,
    String? title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                title,
                style: CustomTextStyle().black16w500,
              ),
              if (isRequired)
                Text(
                  " *",
                  style:
                      CustomTextStyle().black16w500.copyWith(color: Colors.red),
                ),
            ],
          ),
        ),
      Focus(
        debugLabel: hint,
        child: Builder(builder: (context) {
          final FocusNode focusNode = Focus.of(context);
          final bool hasFocus = focusNode.hasFocus;
          return TextFormField(
            cursorColor: textColor ?? mainColor,
            minLines: minLine,
            maxLines: maxLine,
            readOnly: readOnly,
            controller: controller,
            keyboardType: type,
            obscureText: isPassword,
            enabled: isClickable,
            onFieldSubmitted: (s) => onSubmit,
            onChanged: onChange,
            onTap: onTap,
            validator: validate,
            style: TextStyle(
              color: textColor ?? greyColor,
              fontSize: 20,
            ),
            /* textDirection: isRTL
                    ? ui.TextDirection.rtl
                    : ui.TextDirection.ltr, */
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: CustomTextStyle().hintTextStyle,
              prefixIcon: prefix != null
                  ? Icon(
                      prefix,
                      color: iconColor ?? greyColor,
                      size: 26,
                    )
                  : null,
              fillColor: hasFocus && fillColor == null
                  ? focusColor
                  : fillColor ?? lightGreyColor,
              filled: true,
              isDense: true,
              focusColor: focusColor,
              hoverColor: focusColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderWidth ?? 0.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderWidth ?? 0.0),
              ),
              suffixIcon: isPrice
                  ? const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Riyal',
                        ),
                      ))
                  : suffix != null && suffixWidget == null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                            onPressed: suffixPressed,
                            icon: Icon(
                              suffix,
                              size: suffixSize,
                              color: iconColor ?? greyColor,
                            ),
                          ),
                        )
                      : suffixWidget,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          );
        }),
      ),
      if (paddingBottom)
        const SizedBox(
          height: 10,
        ),
    ],
  );
}

Widget defaultOldFormField(
        {required TextEditingController controller,
        required TextInputType type,
        Function? onSubmit,
        ValueSetter<String>? onChange,
        var onTap,
        bool isPassword = false,
        required validate,
        required String label,
        required IconData prefix,
        IconData? suffix,
        var suffixPressed,
        bool isClickable = true,
        bool readOnly = false,
        int minLine = 1,
        int maxLine = 1}) =>
    TextFormField(
      minLines: minLine,
      maxLines: maxLine,
      readOnly: readOnly,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) => onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
