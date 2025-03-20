import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';
import 'package:template/domain/helpers/shared_prefs.dart';
import 'package:template/presentation/shared/buttons.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/globals.dart';
import '../../../../constants/text_styles.dart';
import '../../../shared/app_bar.dart';
import '../../../shared/default_breadcrumb.dart';
import '../../../shared/drawer.dart';
import '../../../shared/spaces.dart';

class SalesItemsReport extends StatefulWidget {
  const SalesItemsReport({super.key});

  @override
  State<SalesItemsReport> createState() => _SalesItemsReportState();
}

class _SalesItemsReportState extends State<SalesItemsReport> {
  Future<void> _selectDateRange(
    BuildContext context,
    HomePageCubit cubit,
  ) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDateRange: cubit.selectedDateRange,
    );

    if (picked != null) {
      setState(() {
        cubit.selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);

        List<String> itemsList = [
          "Item A",
          "Item B",
          "Item C",
          "Item D"
        ]; // Example items list

        return Scaffold(
          appBar: defaultAppBar(context),
          drawer: const CustomDrawer(),
          body: (cubit.productsModel != null)
              ? SingleChildScrollView(
                  child: Padding(
                    padding: defaultPadding,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DefaultBreadCrumb(
                              items: ["Home", "Reports", "Sales Items"]),
                          vertialSpace(3.h),
                          Text(
                            "Sales Items".tr(),
                            style: CustomTextStyle()
                                .main28w700
                                .copyWith(color: mainColor),
                          ),
                          vertialSpace(3.h),

                          // Date Range Picker & Button
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cubit.selectedDateRange == null
                                      ? "Select Date Range".tr()
                                      : "${DateFormat('yyyy-MM-dd').format(cubit.selectedDateRange!.start)} - ${DateFormat('yyyy-MM-dd').format(cubit.selectedDateRange!.end)}",
                                  style: CustomTextStyle().main20w500,
                                ),
                              ),
                              defaultButton(
                                expanded: false,
                                func: () => _selectDateRange(context, cubit),
                                text: "Pick Date".tr(),
                              ),
                            ],
                          ),

                          vertialSpace(3.h),

                          // From Item Dropdown
                          DropdownButtonFormField<String>(
                            value: cubit.selectedFromItem,
                            decoration: InputDecoration(
                              labelText: "From Item".tr(),
                              border: const OutlineInputBorder(),
                            ),
                            items: cubit.productsModel!.data!
                                .map((item) => DropdownMenuItem<String>(
                                      value: item.code.toString(),
                                      child: Text(
                                        "${item.code!}-${item.name!} ",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              cubit.setSelectedFromItem(value);
                            },
                          ),

                          vertialSpace(2.h),

                          // To Item Dropdown
                          DropdownButtonFormField<String>(
                            value: cubit.selectedToItem,
                            decoration: InputDecoration(
                              labelText: "To Item".tr(),
                              border: const OutlineInputBorder(),
                            ),
                            items: cubit.productsModel!.data!
                                .map((item) => DropdownMenuItem<String>(
                                      value: item.code.toString(),
                                      child: Text(
                                        "${item.code!}-${item.name!} ",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                cubit.setSelectedToItem(value);
                              });
                            },
                          ),

                          vertialSpace(3.h),

                          // Submit Button
                          defaultButton(
                            text: "Apply".tr(),
                            func: () async {
                              if (cubit.selectedDateRange != null &&
                                  cubit.selectedFromItem != null &&
                                  cubit.selectedToItem != null) {
                                var customerId = SharedPrefsHelpers.getint(
                                    key: "customerId");
                                print(
                                    "Selected Date Range: ${cubit.selectedDateRange!.start} - ${cubit.selectedDateRange!.end}");
                                print(
                                    "From Item: ${cubit.selectedFromItem}, To Item: ${cubit.selectedToItem}");
                                cubit.getSalesItemsReport(
                                  customerId,
                                );
                              }
                            },
                          ),

                          vertialSpace(3.h),

                          if (state is GetSalesItemsLoadingState)
                            const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                        ]),
                  ),
                )
              : const Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}
