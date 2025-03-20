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

class AccountStatementReport extends StatefulWidget {
  const AccountStatementReport({super.key});

  @override
  State<AccountStatementReport> createState() => _AccountStatementReportState();
}

class _AccountStatementReportState extends State<AccountStatementReport> {
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
                        items: ["Home", "Reports", "Detailed Statement"]),
                    vertialSpace(3.h),
                    Text(
                      "Detailed Statement".tr(),
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

                    // Submit Button
                    defaultButton(
                      text: "Apply".tr(),
                      func: () async {
                        if (cubit.selectedDateRange != null) {
                          var customerId =
                              SharedPrefsHelpers.getint(key: "customerId");
                          print(
                              "Selected Date Range: ${cubit.selectedDateRange!.start} - ${cubit.selectedDateRange!.end}");
                          cubit.getAccountStatement(customerId);
                        }
                      },
                    ),

                    vertialSpace(3.h),
                    if (state is GetAccountStatementLoadingState)
                      const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
