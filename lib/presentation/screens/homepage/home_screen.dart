import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';
import 'package:template/constants/globals.dart';
import 'package:template/constants/text_styles.dart';

import '../../shared/spaces.dart';
import 'graphs/main_report_graphs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        // log(cubit.mainReportModel!.data!.toJson().toString());
        return SingleChildScrollView(
          padding: defaultPadding,
          child: Column(children: [
            if (userModel.data != null)
              Text(
                "${"Welcome".tr()} ${userModel.data!.result!.userName!}",
                style: CustomTextStyle().black24w700,
              ),
            vertialSpace(3.h),
            if (cubit.mainReportModel != null)
              Column(
                children: [
                  dashboardCard(
                    title: "Open Delivery Notes Balance".tr(),
                    count: cubit.mainReportModel!.data!
                        .customerOpenDeliveryNotesBalanace!
                        .toString(),
                    icon: Icons.money_outlined,
                    color: Colors.green,
                    isExpanded: true,
                    isCurrency: true,
                  ),
                  vertialSpace(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dashboardCard(
                        title: "Customer Balance".tr(),
                        count: cubit.mainReportModel!.data!.customerBalance!
                            .toString(),
                        icon: Icons.wallet,
                        color: Colors.purple,
                        isCurrency: true,
                      ),
                      horizontalSpace(3.h),
                      dashboardCard(
                        title: "Customer Credit Limit".tr(),
                        count: cubit.mainReportModel!.data!.customerCrditLimit!
                            .toString(),
                        icon: Icons.credit_card,
                        color: Colors.orange,
                        isCurrency: true,
                      ),
                    ],
                  ),
                  vertialSpace(3.h),
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 18,
                        left: 12,
                        top: 24,
                        bottom: 12,
                      ),
                      child: LineChart(
                        orderCount(cubit),
                      ),
                    ),
                  ),
                  vertialSpace(5.h),
                  AspectRatio(
                    aspectRatio: 1.50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 18,
                        left: 12,
                        top: 24,
                        bottom: 12,
                      ),
                      child: LineChart(
                        orderCost(cubit),
                      ),
                    ),
                  ),
                  vertialSpace(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dashboardCard(
                        title: "Total Deliveries".tr(),
                        count: cubit.mainReportModel!.data!.totalDeliveries!
                            .toString(),
                        icon: Icons.local_shipping,
                        color: Colors.indigo,
                      ),
                      horizontalSpace(3.h),
                      dashboardCard(
                        title: "Total Deliveries Amount".tr(),
                        count: cubit
                            .mainReportModel!.data!.totalDeliveriesAmount!
                            .toString(),
                        icon: Icons.attach_money,
                        color: Colors.orange,
                        isCurrency: true,
                      ),
                    ],
                  ),
                  vertialSpace(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      dashboardCard(
                        title: "Total Orders".tr(),
                        count: cubit.mainReportModel!.data!.totalOrders!
                            .toString(),
                        icon: Icons.shopping_cart,
                        //color: Colors.orange,
                      ),
                      horizontalSpace(3.h),
                      dashboardCard(
                        title: "Total Orders Amount".tr(),
                        count: cubit.mainReportModel!.data!.totalOrdersAmount!
                            .toString(),
                        icon: Icons.attach_money,
                        color: Colors.greenAccent,
                        isCurrency: true,
                      ),
                    ],
                  ),
                  vertialSpace(3.h),
                  Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text(
                                'ITEM CODE'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ITEM NAME'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'COUNT'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: cubit.mainReportModel!.data!
                              .mostOrderedItemsByQuantity!
                              .map((data) {
                            return DataRow(
                              cells: [
                                DataCell(Text(data.itemCode.toString())),
                                DataCell(Text(data.itemName.toString())),
                                DataCell(Text(data.count.toString())),
                              ],
                            );
                          }).toList()),
                    ),
                  ),
                  vertialSpace(3.h),
                  Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text(
                                'ITEM CODE'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ITEM NAME'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'COUNT'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: cubit
                              .mainReportModel!.data!.mostOrderedItemsByAmount!
                              .map((data) {
                            return DataRow(
                              cells: [
                                DataCell(Text(data.itemCode.toString())),
                                DataCell(Text(data.itemName.toString())),
                                DataCell(Text(data.amount.toString())),
                              ],
                            );
                          }).toList()),
                    ),
                  ),
                ],
              )
            else
              const Center(child: CircularProgressIndicator())
          ]),
        );
      },
    );
  }

  Center dashboardCard(
      {required title,
      required count,
      required icon,
      isExpanded = false,
      isCurrency = false,
      Color color = Colors.green}) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        width: isExpanded ? double.infinity : 42.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.3),
              radius: 20,
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 10),
            Text(
              isCurrency
                  ? NumberFormat.decimalPattern().format(double.parse(count))
                  : count,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
