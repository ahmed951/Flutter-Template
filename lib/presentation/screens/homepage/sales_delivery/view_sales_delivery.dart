import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';
import 'package:template/presentation/shared/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/presentation/shared/form_fields.dart';
import 'package:template/presentation/shared/spaces.dart';
import '../../../../constants/globals.dart';
import '../../../shared/card_tile.dart';
import '../../../shared/default_breadcrumb.dart';

class ViewSalesDelivery extends StatefulWidget {
  const ViewSalesDelivery({super.key, this.deliveryId});

  final dynamic deliveryId;

  @override
  State<ViewSalesDelivery> createState() => _ViewSalesDeliveryState();
}

class _ViewSalesDeliveryState extends State<ViewSalesDelivery> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = HomePageCubit.get(context);

    cubit.initSalesDeliveryScreen(widget.deliveryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);

        return Scaffold(
          appBar: defaultAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: defaultPadding,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DefaultBreadCrumb(items: [
                      "Home",
                      "Sales Delivery",
                      "View Sales Delivery"
                    ]),
                    vertialSpace(3.h),
                    Text(
                      "View Sales Delivery".tr(),
                      style: CustomTextStyle()
                          .main28w700
                          .copyWith(color: mainColor),
                    ),
                    vertialSpace(3.h),
                    Text("Sales Delivery Information".tr(),
                        style: CustomTextStyle().black24w700),
                    vertialSpace(3.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller: cubit
                              .salesDeliveryAndOrderTransactionNumberController,
                          type: TextInputType.text,
                          title: "Transaction Number".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.salesDeliveryAndOrderCustomerCodeController,
                          type: TextInputType.text,
                          title: "Customer Code".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.salesDeliveryAndOrderCustomerNameController,
                          type: TextInputType.text,
                          title: "Customer Name".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller: cubit
                              .salesDeliveryAndOrderSelectFactoryController,
                          type: TextInputType.text,
                          title: "Select Factory".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller: cubit
                              .salesDeliveryAndOrderTransactionDateController,
                          type: TextInputType.datetime,
                          title: "Transaction Date".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller: cubit
                              .salesDeliveryAndOrderCustomerCurrentBalanceController,
                          type: TextInputType.number,
                          title: "Customer Current Balance".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller: cubit
                              .salesDeliveryAndOrderCustomerCreditLimitController,
                          type: TextInputType.number,
                          title: "Customer Credit Limit".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.salesDeliveryAndOrderStatusController,
                          type: TextInputType.text,
                          title: "Status".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.salesDeliveryAndOrderSalesmanController,
                          type: TextInputType.text,
                          title: "Salesman".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller: cubit
                              .salesDeliveryAndOrderVatPercentageController,
                          type: TextInputType.number,
                          title: "VAT %".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller: cubit
                              .salesDeliveryAndOrderTotalBeforeVatController,
                          type: TextInputType.number,
                          title: "Total Before VAT".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          isPrice: true,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.salesDeliveryAndOrderVatAmountController,
                          type: TextInputType.number,
                          title: "VAT Amount".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          isPrice: true,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.salesDeliveryAndOrderTotalController,
                          type: TextInputType.number,
                          title: "Total".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          isPrice: true,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        vertialSpace(3.h),
                        Text("Delivery Details".tr(),
                            style: CustomTextStyle().black24w700),
                        vertialSpace(3.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.salesDeliveryLines!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return vertialSpace(1.h);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            var data = cubit.salesDeliveryLines![index];
                            Map map = {
                              "Code": data.itemCode,
                              "Procuct Name": data.itemName,
                              "Quantity Requested": data.quantityRequested,
                              "Quantity Delivered": data.quantityDelivered,
                              "Unit": data.uom,
                              "Unit Price": data.unitPrice,
                              "VAT %": data.vatPercentage,
                              "Total Before VAT": data.totalBeforeVat,
                              "VAT Amount": data.vatAmount,
                              "Total": data.total,
                            };
                            var isPriceList = [
                              "Unit Price",
                              "Total Before VAT",
                              "VAT Amount",
                              "Total"
                            ];

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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: map.entries.map((data) {
                                        return CardTile(
                                          cubit: cubit,
                                          title: data.key.toString(),
                                          data: data.value.toString(),
                                          isPrice: isPriceList
                                              .contains(data.key.toString()),
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
