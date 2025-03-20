import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:template/constants/colors.dart';
import 'package:template/constants/globals.dart';
import 'package:template/constants/strings.dart';
import 'package:template/presentation/shared/spaces.dart';

import '../../constants/global_functions.dart';
import '../../domain/helpers/shared_prefs.dart';

PreferredSizeWidget customAppBar(context, text,
        {List<Widget> actions = const [], bottom, backFunction}) =>
    AppBar(
      backgroundColor: backgroundColor,
      shadowColor: Colors.transparent,
      actions: actions,
      elevation: 0,
      scrolledUnderElevation: 0,
      bottom: bottom,
      leading: IconButton(
        onPressed: () {
          if (backFunction != null) {
            backFunction();
          } else {
            Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.arrow_back_ios_rounded, color: blackColor),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );

PreferredSizeWidget defaultAppBar(context, {backFunction}) => AppBar(
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      elevation: 5,
      toolbarHeight: 70,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: mainColor,
        size: 30,
      ),
      title: Image.asset(
        "assets/images/ejadaLogo.png",
        width: 100,
        height: 100,
      ),
      actions: [
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: userModel.data?.result != null
                ? Image.network(
                    "$baseUrl${userModel.data?.result?.imagePath?.replaceAll("\\", "/")}",
                    width: 100,
                    height: 100,
                  )
                : const Icon(Icons.person),
          ),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Row(
                  children: [
                    Image.network(
                      "$baseUrl${userModel.data?.result?.imagePath?.replaceAll("\\", "/")}",
                      width: 50,
                      height: 50,
                    ),
                    horizontalSpace(2.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vertialSpace(4.h),
                        SizedBox(
                          width: 30.w,
                          child: Text(
                            "${userModel.data?.result?.firstName} ${userModel.data?.result?.lastName}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Visibility(
                          visible: !roles.contains("Customer"),
                          child: TextButton(
                            onPressed: () {
                              // pushNavigate(context, profileRoute);
                            },
                            child: Text("View Profile".tr()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const PopupMenuItem(
                  child: Divider(
                color: mainColor,
              )),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: () {
                    // pushNavigate(context, contactUsRoute);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: mediumGreyColor,
                  ),
                  label: Text(
                    "Settings".tr(),
                    style: const TextStyle(color: mediumGreyColor),
                  ),
                ),
              ),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: () {
                    SharedPrefsHelpers.deleteData(key: "token");
                    SharedPrefsHelpers.deleteData(key: "userId");
                    pushReplaceNavigate(context, loginRoute);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: mediumGreyColor,
                  ),
                  label: Text(
                    "Logout".tr(),
                    style: const TextStyle(color: mediumGreyColor),
                  ),
                ),
              ),
            ];
          },
        )
      ],
    );

/* PreferredSizeWidget whiteAppBar(
  context, {
  title = "",
  List<Widget> actions = const [],
  transparent = false,
  isQuran = false,
  menu = Container,
  color = Colors.white,
  isOnBoarding = false,
  onBoradingFunc,
  showArrow = true,
}) =>
    AppBar(
      backgroundColor: transparent ? Colors.transparent : color,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: mainColor.withOpacity(0.3),

        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
      actions: actions,
      elevation: 0,
      leading: !isQuran
          ? IconButton(
              onPressed: () {
                if (!isOnBoarding) {
                  Navigator.pop(context);
                } else {
                  onBoradingFunc();
                }
              },
              icon: showArrow
                  ? const Icon(Icons.arrow_back_ios_rounded, color: mainColor)
                  : Container(),
              color: mainColor)
          : menu,
      title: !isQuran
          ? Text(
              title,
              style: CustomTextStyle().main20w700,
            )
          : TextButton.icon(
            onPressed: () {
              //cubit.indexController.animateTo(1);
              pushNavigate(context, indexRoute, arguments: {
                "context": context,
                "index": 1,
              });
            },
            icon: isArabicLocale(context)
                ? Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 15,
                    color: mainColor.withOpacity(0.5),
                  )
                : RotatedBox(
                    quarterTurns: 90,
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                      color: mainColor.withOpacity(0.5),
                    ),
                  ),
            label: Text(
              // need to be changed by page number as this method is not working 100% when you go to the prev surah
              "${"Surah".tr()} ${isArabicLocale(context) ? surahList[QuranViewCubit.get(context).currentSurah - 1]["titleAr"] : surahList[QuranViewCubit.get(context).currentSurah - 1]["title"]}",
              style: CustomTextStyle().main16w700,
            ),
          ),
    );
 */
