import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';
import 'package:template/presentation/shared/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/presentation/shared/buttons.dart';
import 'package:template/presentation/shared/form_fields.dart';
import 'package:template/presentation/shared/spaces.dart';
import '../../../../constants/globals.dart';
import '../../../shared/default_breadcrumb.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key, this.isEdit = false, this.vehicleId});
  final bool isEdit;
  final dynamic vehicleId;

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = HomePageCubit.get(context);

    cubit.initVehicleScreen(
        {"isEdit": widget.isEdit, "vehicleId": widget.vehicleId});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        if (state is AddVehicleSuccessState ||
            state is EditVehicleSuccessState) {
          Navigator.pop(context);
        }
      },
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
                    const DefaultBreadCrumb(
                        items: ["Home", "Vehicles", "Add Vehicle"]),
                    vertialSpace(3.h),
                    Text(
                      "Add Vehicle".tr(),
                      style: CustomTextStyle()
                          .main28w700
                          .copyWith(color: mainColor),
                    ),
                    vertialSpace(3.h),

                    Column(
                      children: [
                        defaultFormField(
                          context,
                          isRequired: true,
                          controller: cubit.vehicleNameController,
                          type: TextInputType.name,
                          title: "Vehicle Name".tr(),
                          hint: "Enter Vehicle Name".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Name can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          isRequired: true,
                          controller: cubit.vehicleModelController,
                          type: TextInputType.text,
                          title: "Vehicle Model".tr(),
                          hint: "Enter Vehicle Model".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          isRequired: true,
                          controller: cubit.vehicleColorController,
                          type: TextInputType.text,
                          title: "Vehicle Color".tr(),
                          hint: "Enter Vehicle Color".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          isRequired: true,
                          controller: cubit.vehicleIMEIController,
                          type: TextInputType.text,
                          title: "IMEI".tr(),
                          hint: "Enter IMEI".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          isRequired: true,
                          controller: cubit.vehicleLicenceNumberController,
                          type: TextInputType.text,
                          title: "Vehicle Licence Number".tr(),
                          hint: "Enter Vehicle Licence Number".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          isRequired: true,
                          controller: cubit.vehicleManufactureController,
                          type: TextInputType.text,
                          title: "Vehicle Manufacture".tr(),
                          hint: "Enter Vehicle Manufacture".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        defaultFormField(
                          context,
                          isRequired: true,
                          controller: cubit.vehiclePlatNumberController,
                          type: TextInputType.name,
                          title: "Vehicle Plat Number".tr(),
                          hint: "Enter Vehicle Plat Number".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Default Driver".tr(),
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
                        if (cubit.dropDownDriversModel != null &&
                            state is! GetDriversLoadingState)
                          DropdownButtonHideUnderline(
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                // the menu padding when button's width is not specified.
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // Add more decoration..
                              ),
                              hint: Text(
                                'Enter Default Driver'.tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: cubit.dropDownDriversModel!.data!
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: Text(
                                          "${item.firstName!}  ${item.lastName!}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: cubit.defaultDriver,
                              onChanged: (String? value) {
                                cubit.setAssignedVehicle(value!);
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
                        vertialSpace(2.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Transporter",
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
                        if (cubit.dropDownTransportersModel != null &&
                            state is! GetTransporterLoadingState)
                          DropdownButtonHideUnderline(
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                // the menu padding when button's width is not specified.
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // Add more decoration..
                              ),
                              hint: Text(
                                'Enter Transporter'.tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: cubit.dropDownTransportersModel!.data!
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: Text(
                                          "${item.name!} ",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: cubit.vehicleTransporter,
                              onChanged: (String? value) {
                                cubit.setTransporter(value!);
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
                        CheckboxListTile.adaptive(
                          title: Text(
                            "Status".tr(),
                            style: CustomTextStyle().black16w500,
                          ),
                          value: cubit.vehicleStatus,
                          onChanged: (e) {
                            cubit.changeVehicleStatus();
                          },
                        ),
                        CheckboxListTile.adaptive(
                            title: Text(
                              "Is Internal".tr(),
                              style: CustomTextStyle().black16w500,
                            ),
                            value: cubit.isInternal,
                            onChanged: (e) {
                              cubit.changeIsInternal();
                            })
                      ],
                    ),

                    vertialSpace(4.h),
                    // next and back buttons
                    if (state is! AddVehicleLoadingState &&
                        state is! EditVehicleLoadingState)
                      defaultButton(
                        enabled: true,
                        text: widget.isEdit ? "Edit".tr() : "Add".tr(),
                        func: () {
                          if (formKey.currentState!.validate()) {
                            if (widget.isEdit) {
                              cubit.editVehicle(widget.vehicleId);
                            } else {
                              cubit.addVehicle();
                            }
                          }
                        },
                      )
                    else
                      const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
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
