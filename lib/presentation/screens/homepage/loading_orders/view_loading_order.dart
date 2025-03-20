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
import '../../../shared/default_breadcrumb.dart';

class ViewLoadingOrders extends StatefulWidget {
  const ViewLoadingOrders({super.key, this.orderId});

  final dynamic orderId;

  @override
  State<ViewLoadingOrders> createState() => _ViewLoadingOrdersState();
}

class _ViewLoadingOrdersState extends State<ViewLoadingOrders> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = HomePageCubit.get(context);

    cubit.initLoadingOrdersScreen(widget.orderId);
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
          body: cubit.dropDownDriversModel != null &&
                  cubit.dropDownTransportersModel != null &&
                  cubit.dropDownVehiclesModel != null
              ? SafeArea(
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
                            "Loading Orders",
                            "View Loading Orders"
                          ]),
                          vertialSpace(3.h),
                          Text(
                            "View Loading Orders".tr(),
                            style: CustomTextStyle()
                                .main28w700
                                .copyWith(color: mainColor),
                          ),
                          vertialSpace(3.h),
                          Text("From Factory".tr(),
                              style: CustomTextStyle().black24w700),
                          vertialSpace(3.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defaultFormField(
                                context,
                                readOnly: true,
                                controller:
                                    cubit.loadingOrdersFactoryController,
                                type: TextInputType.text,
                                title: "Factory".tr(),
                                fillColor: Colors.white,
                                borderColor: Colors.grey,
                                validate: (String? s) {
                                  return null;
                                },
                              ),
                              vertialSpace(3.h),
                              Text(
                                "To Client".tr(),
                                style: CustomTextStyle().black24w700,
                              ),
                              vertialSpace(3.h),
                              defaultFormField(
                                context,
                                readOnly: true,
                                controller:
                                    cubit.loadingOrdersClientNameController,
                                type: TextInputType.text,
                                title: "Client Name".tr(),
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
                                    cubit.loadingOrdersLocationController,
                                type: TextInputType.text,
                                title: "Location".tr(),
                                fillColor: Colors.white,
                                borderColor: Colors.grey,
                                validate: (String? s) {
                                  return null;
                                },
                              ),
                              vertialSpace(3.h),
                              Text(
                                "Product Details".tr(),
                                style: CustomTextStyle().black24w700,
                              ),
                              vertialSpace(3.h),
                              defaultFormField(
                                context,
                                readOnly: true,
                                controller:
                                    cubit.loadingOrdersProductController,
                                type: TextInputType.text,
                                title: "Product".tr(),
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
                                    cubit.loadingOrdersQuantityController,
                                type: TextInputType.number,
                                title: "Quantity".tr(),
                                fillColor: Colors.white,
                                borderColor: Colors.grey,
                                validate: (String? s) {
                                  return null;
                                },
                              ),
                              vertialSpace(3.h),
                              Text(
                                "Additional Details".tr(),
                                style: CustomTextStyle().black24w700,
                              ),
                              vertialSpace(3.h),
                              defaultFormField(
                                context,
                                readOnly: true,
                                controller: cubit
                                    .loadingOrdersCustomerReferenceNoController,
                                type: TextInputType.text,
                                title: "Customer Reference No".tr(),
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
                                    .loadingOrdersTransactionDateController,
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
                                controller:
                                    cubit.loadingOrdersNoOfRequestsController,
                                type: TextInputType.number,
                                title: "No of Requests".tr(),
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
                                    cubit.loadingOrdersTransporterController,
                                type: TextInputType.text,
                                title: "Transporter".tr(),
                                fillColor: Colors.white,
                                borderColor: Colors.grey,
                                validate: (String? s) {
                                  return null;
                                },
                              ),
                              defaultFormField(
                                context,
                                readOnly: true,
                                controller: cubit.loadingOrdersTruckController,
                                type: TextInputType.text,
                                title: "Truck".tr(),
                                fillColor: Colors.white,
                                borderColor: Colors.grey,
                                validate: (String? s) {
                                  return null;
                                },
                              ),
                              defaultFormField(
                                context,
                                readOnly: true,
                                controller: cubit.loadingOrdersDriverController,
                                type: TextInputType.text,
                                title: "Driver".tr(),
                                fillColor: Colors.white,
                                borderColor: Colors.grey,
                                validate: (String? s) {
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
