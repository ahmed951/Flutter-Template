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
import 'package:template/presentation/shared/dialogs.dart';
import 'package:template/presentation/shared/drawer.dart';
import 'package:template/presentation/shared/spaces.dart';

import '../../../../constants/global_functions.dart';
import '../../../../constants/globals.dart';
import '../../../../constants/strings.dart';
import '../../../shared/buttons.dart';
import '../../../shared/card_tile.dart';
import '../../../shared/default_breadcrumb.dart';
import '../../../shared/visibility_widget.dart';

class SalesQuotationsScreen extends StatelessWidget {
  SalesQuotationsScreen({super.key});

  final MenuItems menu = MenuItems(items: [
    MenuItem(text: 'View'.tr()),
    MenuItem(text: 'Accept'.tr()),
    MenuItem(text: 'Reject'.tr()),
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
                  const DefaultBreadCrumb(items: ["Home", "Sales Quotation"]),
                  vertialSpace(3.h),
                  Text(
                    "Sales Quotation".tr(),
                    style:
                        CustomTextStyle().main28w700.copyWith(color: mainColor),
                  ),
                  vertialSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSearchTextField(
                          onChanged: (e) {
                            cubit.searchSalesQuotations();
                          },
                          controller: cubit.salesQuotationsSearchController,
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
                        type: "salesQuotations",
                      ),
                    ],
                  ),
                  vertialSpace(3.h),
                  if (cubit.salesQuotationsModel != null)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          cubit.salesQuotationsSearchController.text.isEmpty
                              ? cubit.salesQuotationsList.length
                              : cubit.searchSalesQuotationsList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return vertialSpace(2.h);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var data =
                            cubit.salesQuotationsSearchController.text.isEmpty
                                ? cubit.salesQuotationsList[index]
                                : cubit.searchSalesQuotationsList[index];
                        return InkWell(
                          onTap: () {
                            pushNavigate(context, viewSalesQuotationRoute,
                                arguments: {
                                  "context": context,
                                  "quotationId": data["Id"]
                                });
                          },
                          child: Card(
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
                                              bool enabled = false;
                                              if ((item.text == "Accept".tr() ||
                                                      item.text ==
                                                          "Reject".tr()) &&
                                                  (data["Status"] ==
                                                      cubit.getSalesOrderStatus(
                                                          1))) {
                                                enabled = true;
                                              } else if (item.text ==
                                                  "View".tr()) {
                                                enabled = true;
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
                                            if (value!.text == "Accept".tr()) {
                                              print("accept");
                                              defaultGeneralDialog(context,
                                                  title:
                                                      "Accept Sales Quotation"
                                                          .tr(),
                                                  content:
                                                      "Do you want to accept the sales quotation"
                                                          .tr(), func: () {
                                                cubit.acceptSalesQuotation(
                                                  data["Id"],
                                                );
                                              });
                                            }
                                            if (value.text == "Reject".tr()) {
                                              print("reject");
                                              defaultGeneralDialog(context,
                                                  title:
                                                      "Reject Sales Quotation"
                                                          .tr(),
                                                  content:
                                                      "Do you want to reject the sales quotation"
                                                          .tr(), func: () {
                                                cubit.rejectSalesQuotation(
                                                  data["Id"],
                                                );
                                              });
                                            } else if (value.text ==
                                                "View".tr()) {
                                              pushNavigate(context,
                                                  viewSalesQuotationRoute,
                                                  arguments: {
                                                    "context": context,
                                                    "quotationId": data["Id"]
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
