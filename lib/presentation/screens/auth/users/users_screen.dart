import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:template/bloc/auth/auth_cubit.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/global_functions.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/domain/models/menu_items.dart';
import 'package:template/presentation/shared/app_bar.dart';
import 'package:template/presentation/shared/drawer.dart';
import 'package:template/presentation/shared/spaces.dart';

import '../../../../constants/globals.dart';
import '../../../../constants/strings.dart';
import '../../../shared/buttons.dart';
import '../../../shared/card_tile.dart';
import '../../../shared/default_breadcrumb.dart';
import '../../../shared/dialogs.dart';
import '../../../shared/export_widget.dart';
import '../../../shared/visibility_widget.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});
  final chips = ["Home".tr(), "Active".tr(), "Inactive".tr()];
  final List<Map<String, dynamic>> users = [
    {
      "code": "25152",
      "name": "Alaa",
      "username": "ahmed222458",
      "email": "a22hmed@gmail.com",
    },
    {
      "code": "135152",
      "name": "Ahmed Alaa",
      "username": "ahmed458",
      "email": "ahmed@gmail.com",
    },
  ];
  final MenuItems menu = MenuItems(items: [
    MenuItem(text: 'Assign Vechiles'.tr()),
    MenuItem(text: 'Deactivated User'.tr()),
    MenuItem(text: 'Edit'.tr()),
    MenuItem(text: 'Delete'.tr())
  ]);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(context),
          drawer: const CustomDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DefaultBreadCrumb(items: ["User Managment", "Users"]),
                  vertialSpace(3.h),
                  Text(
                    "Users".tr(),
                    style:
                        CustomTextStyle().main28w700.copyWith(color: mainColor),
                  ),
                  vertialSpace(3.h),
                  SizedBox(
                    height: 5.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: chips.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return horizontalSpace(5.w);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ChoiceChip(
                          label: Text(
                            chips[index],
                            style: CustomTextStyle().white16w500.copyWith(
                                  color: cubit.currentChipIndex == index
                                      ? Colors.white
                                      : mediumGreyColor,
                                ),
                          ),
                          selected: cubit.currentChipIndex == index,
                          selectedColor: mainColor,
                          shadowColor: Colors.transparent,
                          selectedShadowColor: Colors.transparent,
                          elevation: 0,
                          disabledColor: Colors.white,
                          backgroundColor: Colors.white,
                          onSelected: (value) {
                            cubit.changeChipIndex(index);
                          },
                          padding: const EdgeInsets.all(10),
                        );
                      },
                    ),
                  ),
                  vertialSpace(3.h),
                  const ExportWidget(),
                  vertialSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSearchTextField(
                          onChanged: (e) {
                            cubit.searchUsers();
                          },
                          controller: cubit.userSearchController,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      horizontalSpace(3.w),
                      if (showFilter)
                        defaultIconButton(
                          icon: Icons.filter_alt,
                          func: () {
                            print("filter");
                          },
                        ),
                      horizontalSpace(3.w),
                      AuthVisibilityWidget(cubit: cubit, type: "users"),
                    ],
                  ),
                  vertialSpace(3.h),
                  defaultButtonWithIcon(
                      text: "Add User".tr(),
                      func: () {
                        pushNavigate(context, addUserRoute, arguments: {
                          "context": context,
                          "isEdit": false
                        }).then((value) => cubit.getUsers());
                      },
                      icon: Icons.add),
                  vertialSpace(3.h),
                  if (cubit.usersModel != null &&
                      state is! DeleteUserSuccessState)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.userSearchController.text.isEmpty &&
                              cubit.currentChipIndex == 0
                          ? cubit.usersList.length
                          : cubit.searchUsersList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return vertialSpace(2.h);
                      },
                      itemBuilder: (BuildContext itemContext, int index) {
                        var user = cubit.userSearchController.text.isEmpty &&
                                cubit.currentChipIndex == 0
                            ? cubit.usersList[index]
                            : cubit.searchUsersList[index];
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: defaultPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    if (user["Image"] != null)
                                      CircleAvatar(
                                        radius: 5.w,
                                        backgroundImage: NetworkImage(
                                            "$baseUrl${user["Image"].replaceAll("\\", "/")}"),
                                      ),
                                    const Spacer(),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: const Icon(
                                          Icons.more_vert_rounded,
                                          color: greyColor,
                                          size: 30,
                                        ),
                                        items: menu.items.map(
                                          (item) {
                                            bool enabled = true;
                                            if (item.text == "Edit".tr() &&
                                                (user["Status"] ==
                                                    "Deactivated")) {
                                              enabled = false;
                                            }
                                            return DropdownMenuItem<MenuItem>(
                                              value: item,
                                              child: menu.buildItem(item,
                                                  enabled: enabled),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          if (value!.text == "Delete".tr()) {
                                            print("delete ${user["Id"]}");
                                            deleteDialog(itemContext,
                                                type: "user", func: () {
                                              cubit.deleteUser(user["Id"]);
                                            });
                                          } else if (value.text ==
                                              "Deactivated User".tr()) {
                                            print(
                                                "Deactivated User ${user["Id"]}");
                                            defaultGeneralDialog(itemContext,
                                                title: "Deactivated User",
                                                button: "Deactivate".tr(),
                                                content:
                                                    "Are you sure you want to deactivate this user?"
                                                        .tr(), func: () {
                                              cubit.deactivateUser(user["Id"]);
                                            });
                                          } else if (value.text ==
                                              "Edit".tr()) {
                                            print(context);
                                            pushNavigate(context, addUserRoute,
                                                arguments: {
                                                  "context": context,
                                                  "isEdit": true,
                                                  "userId": user["Id"]
                                                }).then((value) {
                                              cubit.getUsers();
                                            });
                                          }
                                        },
                                        dropdownStyleData: DropdownStyleData(
                                          width: 160,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          offset: const Offset(-100, -20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                vertialSpace(4.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: user.entries.map((entry) {
                                    return CardTile(
                                      cubit: cubit,
                                      title: entry.key,
                                      data: entry.value.toString(),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  else
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
