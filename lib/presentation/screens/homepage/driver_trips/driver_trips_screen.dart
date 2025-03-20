import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/domain/models/menu_items.dart';
import 'package:template/presentation/shared/app_bar.dart';
import 'package:template/presentation/shared/drawer.dart';
import 'package:template/presentation/shared/spaces.dart';

import '../../../../../constants/globals.dart';
import '../../../../../constants/strings.dart';
import '../../../shared/buttons.dart';
import '../../../shared/card_tile.dart';
import '../../../shared/default_breadcrumb.dart';
import '../../../shared/form_fields.dart';
import '../../../shared/visibility_widget.dart';

class DriverTripsScreen extends StatelessWidget {
  DriverTripsScreen({super.key});

  final MenuItems menu = MenuItems(items: [
    MenuItem(text: 'View'.tr()),
    MenuItem(text: 'Complete order'.tr()),
  ]);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(context),
          drawer: const CustomDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DefaultBreadCrumb(items: ["Home", "Driver Trips"]),
                  vertialSpace(3.h),
                  Text(
                    "Driver Trips".tr(),
                    style:
                        CustomTextStyle().main28w700.copyWith(color: mainColor),
                  ),
                  vertialSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSearchTextField(
                          onChanged: (e) {
                            cubit.searchDriverTrips();
                          },
                          controller: cubit.driverTripsSearchController,
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
                      HomePageVisibilityWidget(
                        cubit: cubit,
                        type: "driverTrips",
                      ),
                    ],
                  ),
                  vertialSpace(3.h),
                  if (cubit.driverTripsModel != null &&
                      state is! CompleteLoadingOrderSuccessState &&
                      state is! GetDriverTripsLoadingState)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.driverTripsSearchController.text.isEmpty
                          ? cubit.driverTripsList.length
                          : cubit.searchDriverTripsList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return vertialSpace(2.h);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var data =
                            cubit.driverTripsSearchController.text.isEmpty
                                ? cubit.driverTripsList[index]
                                : cubit.searchDriverTripsList[index];
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
                                    if (data["Image"] != null)
                                      CircleAvatar(
                                        radius: 5.w,
                                        backgroundImage: NetworkImage(
                                            "$baseUrl${data["Image"].replaceAll("\\", "/")}"),
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
                                            if (item.text ==
                                                    "Complete order".tr() &&
                                                data["Status"] == "Completed") {
                                              enabled = false;
                                            }
                                            return DropdownMenuItem<MenuItem>(
                                              value: item,
                                              enabled: enabled,
                                              child: menu.buildItem(item,
                                                  enabled: enabled),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          if (value!.text ==
                                              "Deactivated User") {
                                            print("dect u");
                                          } else if (value.text ==
                                              'Complete order'.tr()) {
                                            //show dialog to complete the order and add the order to the completed orders list
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    "Complete Order".tr(),
                                                    style: CustomTextStyle()
                                                        .black16w500,
                                                  ),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Form(
                                                      key: cubit
                                                          .completeOrderFormKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "Are you sure you want to complete this order?"
                                                                .tr(),
                                                            style:
                                                                CustomTextStyle()
                                                                    .black16w500,
                                                          ),
                                                          vertialSpace(2.h),
                                                          defaultFormField(
                                                            context,
                                                            isRequired: true,
                                                            suffixWidget:
                                                                Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 5,
                                                                  vertical: 20),
                                                              child: Text(
                                                                "Ton".tr(),
                                                                style: CustomTextStyle()
                                                                    .black16w500,
                                                              ),
                                                            ),
                                                            controller: cubit
                                                                .completeOrderQuantityController,
                                                            type: TextInputType
                                                                .text,
                                                            title:
                                                                "Quantity you recived"
                                                                    .tr(),
                                                            hint:
                                                                "Enter Quantity you recived"
                                                                    .tr(),
                                                            fillColor:
                                                                Colors.white,
                                                            borderColor:
                                                                Colors.grey,
                                                            validate:
                                                                (String? s) {
                                                              if (s!.isEmpty) {
                                                                return "Can't be empty"
                                                                    .tr();
                                                              } else if (double
                                                                      .parse(
                                                                          s) <
                                                                  0) {
                                                                return "Can't be less than 0"
                                                                    .tr();
                                                              } else if (double
                                                                      .parse(
                                                                          s) >
                                                                  data[
                                                                      "Quantity"]) {
                                                                return "Can't be more than the order quantity"
                                                                    .tr();
                                                              }

                                                              return null;
                                                            },
                                                          ),
                                                          vertialSpace(2.h),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    defaultFormField(
                                                                  context,
                                                                  readOnly:
                                                                      true,
                                                                  isRequired:
                                                                      true,
                                                                  controller: cubit
                                                                      .completeOrderImageController,
                                                                  type:
                                                                      TextInputType
                                                                          .text,
                                                                  title:
                                                                      "Delivery File"
                                                                          .tr(),
                                                                  hint:
                                                                      "Enter Delivery File"
                                                                          .tr(),
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  borderColor:
                                                                      Colors
                                                                          .grey,
                                                                  validate:
                                                                      (String?
                                                                          s) {
                                                                    if (s!
                                                                        .isEmpty) {
                                                                      return "Can't be empty"
                                                                          .tr();
                                                                    }
                                                                    return null;
                                                                  },
                                                                ),
                                                              ),
                                                              horizontalSpace(
                                                                  2.w),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            25.0),
                                                                child:
                                                                    defaultIconButton(
                                                                  icon: Icons
                                                                      .attach_file,
                                                                  func: () {
                                                                    cubit.pickImage(
                                                                        false);
                                                                  },
                                                                ),
                                                              ),
                                                              horizontalSpace(
                                                                  2.w),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            25.0),
                                                                child:
                                                                    defaultIconButton(
                                                                  icon: Icons
                                                                      .camera_alt_rounded,
                                                                  func: () {
                                                                    cubit.pickImage(
                                                                        true);
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Cancel".tr(),
                                                        style: CustomTextStyle()
                                                            .black16w500,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        if (cubit
                                                            .completeOrderFormKey
                                                            .currentState!
                                                            .validate()) {
                                                          cubit
                                                              .completeLoadingOrder(
                                                                  data["Id"]);
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      child: Text(
                                                        "Confirm".tr(),
                                                        style: CustomTextStyle()
                                                            .black16w500,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
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
                                  children: data.entries.map((entry) {
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
