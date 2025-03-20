import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';
import 'package:template/constants/global_functions.dart';
import 'package:template/presentation/shared/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/presentation/shared/form_fields.dart';
import 'package:template/presentation/shared/spaces.dart';
import '../../../../constants/globals.dart';
import '../../../shared/buttons.dart';
import '../../../shared/card_tile.dart';
import '../../../shared/default_breadcrumb.dart';

class ViewPurchaseOrders extends StatefulWidget {
  const ViewPurchaseOrders(
      {super.key, this.orderId, this.isEdit = false, this.isAdd = false});

  final dynamic orderId;
  final bool isEdit;
  final bool isAdd;

  @override
  State<ViewPurchaseOrders> createState() => _ViewPurchaseOrdersState();
}

class _ViewPurchaseOrdersState extends State<ViewPurchaseOrders> {
  final formKey = GlobalKey<FormState>();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    var cubit = HomePageCubit.get(context);

    cubit.initPurchaseOrdersScreen({
      "orderId": widget.orderId,
      "isAdd": widget.isAdd,
      "isEdit": widget.isEdit
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        if (state is AddPurchaseOrderSuccessState) {
          pop(context);
        }
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);

        return Scaffold(
          key: scaffoldkey,
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
                      "Purchase Order",
                      "View Purchase Order"
                    ]),
                    vertialSpace(3.h),
                    Text(
                      "View Purchase Order".tr(),
                      style: CustomTextStyle()
                          .main28w700
                          .copyWith(color: mainColor),
                    ),
                    vertialSpace(3.h),
                    Text("Purchase Order Information".tr(),
                        style: CustomTextStyle().black24w700),
                    vertialSpace(3.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: !widget.isEdit && !widget.isAdd,
                          child: defaultFormField(
                            context,
                            readOnly: true,
                            controller:
                                cubit.purchaseOrdersTransactionNumberController,
                            type: TextInputType.text,
                            title: "Transaction Number".tr(),
                            fillColor: Colors.white,
                            borderColor: Colors.grey,
                            validate: (String? s) {
                              return null;
                            },
                          ),
                        ),
                        if (!widget.isEdit && !widget.isAdd)
                          defaultFormField(
                            context,
                            readOnly: true,
                            controller:
                                cubit.purchaseOrdersSelectFactoryController,
                            type: TextInputType.text,
                            title: "Select Factory".tr(),
                            fillColor: Colors.white,
                            borderColor: Colors.grey,
                            validate: (String? s) {
                              return null;
                            },
                          ),
                        if (widget.isEdit || widget.isAdd)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Select Factory",
                                  style: CustomTextStyle().black16w500,
                                ),
                                Text(
                                  " *",
                                  style: CustomTextStyle()
                                      .black16w500
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        if (cubit.factoriesModel != null &&
                            state is! GetFactoriesLoadingState)
                          Visibility(
                            visible: widget.isEdit || widget.isAdd,
                            child: Column(
                              children: [
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField2<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                                      // the menu padding when button's width is not specified.
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      // Add more decoration..
                                    ),
                                    hint: Text(
                                      'Select Factory'.tr(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: cubit.factoriesModel!.data!
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item.id.toString(),
                                              child: Text(
                                                "${item.code!}-${item.name!} ",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: cubit.selectedFactory,
                                    onChanged: (String? value) {
                                      cubit.setFactory(value!);
                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 40,
                                      width: 140,
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                    ),
                                  ),
                                ),
                                vertialSpace(2.h),
                              ],
                            ),
                          )
                        else
                          Visibility(
                            visible: widget.isEdit || widget.isAdd,
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.purchaseOrdersTransactionDateController,
                          type: TextInputType.datetime,
                          title: "Transaction Date".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            return null;
                          },
                        ),
                        Visibility(
                          visible: !widget.isEdit && !widget.isAdd,
                          child: defaultFormField(
                            context,
                            readOnly: true,
                            controller: cubit.purchaseOrdersStatusController,
                            type: TextInputType.text,
                            title: "Status".tr(),
                            fillColor: Colors.white,
                            borderColor: Colors.grey,
                            validate: (String? s) {
                              return null;
                            },
                          ),
                        ),
                        defaultFormField(
                          context,
                          readOnly: true,
                          controller:
                              cubit.purchaseOrdersVatPercentageController,
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
                              cubit.purchaseOrdersTotalBeforeVatController,
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
                          controller: cubit.purchaseOrdersVatAmountController,
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
                          controller: cubit.purchaseOrdersTotalController,
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
                        Row(
                          children: [
                            Text("Order Details".tr(),
                                style: CustomTextStyle().black24w700),
                            const Spacer(),
                            if (widget.isEdit || widget.isAdd)
                              FloatingActionButton(
                                onPressed: () {
                                  // add item dialog
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return StatefulBuilder(
                                          builder: (context, setState2) {
                                        return SafeArea(
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: defaultPadding,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Add Item".tr(),
                                                          style:
                                                              CustomTextStyle()
                                                                  .black24w700),
                                                      const Spacer(),
                                                      IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.close),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Code",
                                                          style:
                                                              CustomTextStyle()
                                                                  .black16w500,
                                                        ),
                                                        Text(
                                                          " *",
                                                          style: CustomTextStyle()
                                                              .black16w500
                                                              .copyWith(
                                                                  color: Colors
                                                                      .red),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButtonFormField2<
                                                            String>(
                                                      isExpanded: true,
                                                      decoration:
                                                          InputDecoration(
                                                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                        // the menu padding when button's width is not specified.
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                      ),
                                                      hint: Text(
                                                        'Code'.tr(),
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Theme.of(context)
                                                                  .hintColor,
                                                        ),
                                                      ),
                                                      items: cubit
                                                          .productsModel!.data!
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item.id
                                                                    .toString(),
                                                                child: Text(
                                                                  "${item.code!}-${item.name!} ",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      value: cubit.productCode,
                                                      onChanged:
                                                          (String? value) {
                                                        cubit.setProductCode(
                                                            value!);
                                                        setState2(() {});
                                                      },
                                                      buttonStyleData:
                                                          const ButtonStyleData(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 16),
                                                        height: 40,
                                                        width: 140,
                                                      ),
                                                      menuItemStyleData:
                                                          const MenuItemStyleData(
                                                        height: 40,
                                                      ),
                                                    ),
                                                  ),
                                                  vertialSpace(2.h),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Customer Address",
                                                          style:
                                                              CustomTextStyle()
                                                                  .black16w500,
                                                        ),
                                                        Text(
                                                          " *",
                                                          style: CustomTextStyle()
                                                              .black16w500
                                                              .copyWith(
                                                                  color: Colors
                                                                      .red),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButtonFormField2<
                                                            String>(
                                                      isExpanded: true,
                                                      decoration:
                                                          InputDecoration(
                                                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                        // the menu padding when button's width is not specified.
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                      ),
                                                      hint: Text(
                                                        'Customer Address'.tr(),
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Theme.of(context)
                                                                  .hintColor,
                                                        ),
                                                      ),
                                                      items: cubit
                                                          .customerModel!
                                                          .data!
                                                          .customerAddresses!
                                                          .map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item.id
                                                                    .toString(),
                                                                child: Text(
                                                                  "${item.name!} ",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      value:
                                                          cubit.customerAddress,
                                                      onChanged:
                                                          cubit.productCode !=
                                                                  null
                                                              ? (String?
                                                                  value) {
                                                                  cubit.setCustomerAddress(
                                                                      value!);
                                                                  setState2(
                                                                      () {});
                                                                }
                                                              : null,
                                                      buttonStyleData:
                                                          const ButtonStyleData(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 16),
                                                        height: 40,
                                                        width: 140,
                                                      ),
                                                      menuItemStyleData:
                                                          const MenuItemStyleData(
                                                        height: 40,
                                                      ),
                                                    ),
                                                  ),
                                                  defaultFormField(
                                                    context,
                                                    readOnly: true,
                                                    controller: cubit
                                                        .purchaseOrdersProductNameController,
                                                    type: TextInputType.number,
                                                    title: "Procuct Name".tr(),
                                                    fillColor: Colors.white,
                                                    borderColor: Colors.grey,
                                                    validate: (String? s) {
                                                      return null;
                                                    },
                                                  ),
                                                  defaultFormField(
                                                    context,
                                                    readOnly: cubit
                                                                .productCode ==
                                                            null ||
                                                        cubit.customerAddress ==
                                                            null,
                                                    controller: cubit
                                                        .purchaseOrdersProductQuantityController,
                                                    type: TextInputType.number,
                                                    onChange: (e) {
                                                      cubit.updateQuantity();
                                                      setState2(() {});
                                                    },
                                                    title: "Quantity".tr(),
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
                                                        .purchaseOrdersProductUnitController,
                                                    type: TextInputType.number,
                                                    title: "Unit".tr(),
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
                                                        .purchaseOrdersProductUnitPriceController,
                                                    type: TextInputType.number,
                                                    title: "Unit Price".tr(),
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
                                                        .purchaseOrdersProductVatController,
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
                                                        .purchaseOrdersProductTotalBeforeVatController,
                                                    type: TextInputType.number,
                                                    title:
                                                        "Total Before VAT".tr(),
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
                                                        .purchaseOrdersProductVatAmountController,
                                                    type: TextInputType.number,
                                                    title: "VAT Amount".tr(),
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
                                                        .purchaseOrdersProductTotalPriceController,
                                                    type: TextInputType.number,
                                                    title:
                                                        "Total Before VAT".tr(),
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
                                                        .purchaseOrdersProductSalesQuotationNumberController,
                                                    type: TextInputType.number,
                                                    title:
                                                        "Sales Quotation Number"
                                                            .tr(),
                                                    fillColor: Colors.white,
                                                    borderColor: Colors.grey,
                                                    validate: (String? s) {
                                                      return null;
                                                    },
                                                  ),
                                                  vertialSpace(2.h),
                                                  defaultButton(
                                                      text: "Add".tr(),
                                                      func: () {
                                                        cubit
                                                            .addPurchaseOrderLine();
                                                        Navigator.pop(context);
                                                      }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                    elevation: 5,
                                    isDismissible: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    enableDrag: true,
                                    backgroundColor: Colors.grey[100],
                                  );
                                },
                                backgroundColor: mainColor,
                                child: const Icon(Icons.add),
                              ),
                          ],
                        ),
                        vertialSpace(3.h),
                        if (cubit.customerModel != null)
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.purchaseOrdersLines!.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return vertialSpace(1.h);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              var data = cubit.purchaseOrdersLines![index];
                              Map map = {
                                "Code": data.itemCode,
                                "Procuct Name": data.itemName,
                                "Customer Address": cubit
                                    .customerModel!.data!.customerAddresses!
                                    .firstWhere((element) =>
                                        element.id == data.customerAddressId)
                                    .address,
                                "Quantity": data.quantity,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: mainColor,
                                        child: Text("${index + 1}",
                                            style:
                                                CustomTextStyle().white16w500),
                                      ),
                                      const Divider(),
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
                          )
                        else
                          const Center(
                            child: CircularProgressIndicator.adaptive(),
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
                                Text(cubit.purchaseOrdersNoteController.text),
                          ),
                        ),
                        vertialSpace(3.h),
                        if (widget.isEdit || widget.isAdd)
                          defaultButton(
                              text: "Save".tr(),
                              func: () {
                                cubit.addPurchaseOrder();
                              }),
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
