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

class ViewSalesQuotation extends StatefulWidget {
  const ViewSalesQuotation({super.key, this.quotationId});

  final dynamic quotationId;

  @override
  State<ViewSalesQuotation> createState() => _ViewSalesQuotationState();
}

class _ViewSalesQuotationState extends State<ViewSalesQuotation> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = HomePageCubit.get(context);

    cubit.initSalesQuotationScreen(widget.quotationId);
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
                      "Sales Quotation",
                      "View Sales Quotation"
                    ]),
                    vertialSpace(3.h),
                    Text(
                      "View Sales Quotation".tr(),
                      style: CustomTextStyle()
                          .main28w700
                          .copyWith(color: mainColor),
                    ),
                    vertialSpace(3.h),
                    Text("Sales Quotation Information".tr(),
                        style: CustomTextStyle().black24w700),
                    vertialSpace(3.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.salesQuotationTransactionNumberController,
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
                              cubit.salesQuotationCustomerCodeController,
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
                              cubit.salesQuotationSelectedAddressesController,
                          type: TextInputType.text,
                          title: "Selected Addresses".tr(),
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
                              cubit.salesQuotationSelectFactoryController,
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
                          controller:
                              cubit.salesQuotationTransactionDateController,
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
                          controller: cubit.salesQuotationStatusController,
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
                          controller: cubit.salesQuotationSalesmanController,
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
                          controller:
                              cubit.salesQuotationVatPercentageController,
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
                          controller:
                              cubit.salesQuotationTotalBeforeVatController,
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
                          controller: cubit.salesQuotationVatAmountController,
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
                          controller: cubit.salesQuotationTotalController,
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
                          itemCount: cubit.salesQuotationLines!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return vertialSpace(1.h);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            var data = cubit.salesQuotationLines![index];
                            Map map = {
                              "Code": data.itemCode,
                              "Procuct Name": data.itemName,
                              "Quantity": data.quantity,
                              "Unit": data.uom,
                              "Unit Price": data.unitPrice,
                              "VAT %": data.vatPercentage,
                              "Total Before VAT": data.totalBeforeVat,
                              "VAT Amount": data.vatAmount,
                              "Total": data.total,
                            };

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
                        vertialSpace(3.h),
                        Text("Notes".tr(),
                            style: CustomTextStyle().black24w700),
                        vertialSpace(3.h),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title:
                                Text(cubit.salesQuotationNoteController.text),
                          ),
                        ),
                        vertialSpace(3.h),
                        Text("Extra Information".tr(),
                            style: CustomTextStyle().black24w700),
                        vertialSpace(3.h),
                        Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                CheckboxListTile.adaptive(
                                  title: Text(
                                    "Wooden Basses Included".tr(),
                                    style: CustomTextStyle().black16w500,
                                  ),
                                  value: cubit.woodenBassesIncluded,
                                  onChanged: (e) {
                                    // cubit.changeVehicleStatus();
                                  },
                                ),
                                CheckboxListTile.adaptive(
                                  title: Text(
                                    "Unloading Included".tr(),
                                    style: CustomTextStyle().black16w500,
                                  ),
                                  value: cubit.unloadingIncluded,
                                  onChanged: (e) {
                                    // cubit.changeVehicleStatus();
                                  },
                                ),
                              ],
                            ))
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
