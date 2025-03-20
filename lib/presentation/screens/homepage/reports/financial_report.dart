import 'package:easy_localization/easy_localization.dart';
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

import '../../../../constants/globals.dart';
import '../../../../domain/helpers/shared_prefs.dart';
import '../../../shared/buttons.dart';
import '../../../shared/card_tile.dart';
import '../../../shared/default_breadcrumb.dart';

class FinancialReportScreen extends StatefulWidget {
  const FinancialReportScreen({super.key});

  @override
  State<FinancialReportScreen> createState() => _FinancialReportScreenState();
}

class _FinancialReportScreenState extends State<FinancialReportScreen> {
  final MenuItems menu = MenuItems(items: []);

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
                  const DefaultBreadCrumb(
                      items: ["Home", "Financial Statements"]),
                  vertialSpace(3.h),
                  Text(
                    "Financial Statements".tr(),
                    style:
                        CustomTextStyle().main28w700.copyWith(color: mainColor),
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

                  // Submit Button
                  defaultButton(
                    text: "Apply".tr(),
                    func: () async {
                      if (cubit.selectedDateRange != null) {
                        var customerId =
                            SharedPrefsHelpers.getint(key: "customerId");
                        print(
                            "Selected Date Range: ${cubit.selectedDateRange!.start} - ${cubit.selectedDateRange!.end}");
                        cubit.getFinancialReport(customerId);
                      }
                    },
                  ),

                  vertialSpace(3.h),
                  if (cubit.financialReportModel != null &&
                      state is! GetFinancialReportLoadingState)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          cubit.financialReportSearchController.text.isEmpty
                              ? cubit.financialReportList.length
                              : cubit.searchFinancialReportList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return vertialSpace(2.h);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var data =
                            cubit.financialReportSearchController.text.isEmpty
                                ? cubit.financialReportList[index]
                                : cubit.searchFinancialReportList[index];
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: data.entries.map((entry) {
                                    return CardTile(
                                      cubit: cubit,
                                      title: entry.key,
                                      data: entry.value.toString(),
                                      shouldNotBeSelected: true,
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  if (state is GetFinancialReportLoadingState)
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
