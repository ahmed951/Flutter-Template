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
import '../../../../constants/countries.dart';
import '../../../../constants/globals.dart';
import '../../../shared/default_breadcrumb.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({super.key, this.isEdit = false, this.driverId});
  final bool isEdit;
  final dynamic driverId;

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = HomePageCubit.get(context);

    cubit.initDriverScreen(
        {"isEdit": widget.isEdit, "driverId": widget.driverId});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        if (state is AddDriverSuccessState || state is EditDriverSuccessState) {
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
                        items: ["Home", "Drivers", "Add Driver"]),
                    vertialSpace(3.h),
                    Text(
                      "Add Driver".tr(),
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
                          controller: cubit.driverFirstNameController,
                          type: TextInputType.name,
                          title: "Driver First Name".tr(),
                          hint: "Enter Driver First Name".tr(),
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
                          controller: cubit.driverLastNameController,
                          type: TextInputType.name,
                          title: "Driver Last Name".tr(),
                          hint: "Enter Driver Last Name".tr(),
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
                          controller: cubit.vehicleLicenceNumberController,
                          type: TextInputType.text,
                          title: "Vehicle licence number".tr(),
                          hint: "Enter Vehicle licence number".tr(),
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
                          controller: cubit.driverPhoneController,
                          type: TextInputType.phone,
                          title: "Phone".tr(),
                          hint: "Enter Phone number".tr(),
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
                                "Nationality",
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
                              'Enter Nationality'.tr(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: countries
                                .map((Map item) => DropdownMenuItem<String>(
                                      value: item['name'],
                                      child: Text(
                                        item['name'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: cubit.selectedNationality,
                            onChanged: (String? value) {
                              cubit.setNationality(value!);
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
                                "Assigned Vehicle".tr(),
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
                        if (cubit.dropDownVehiclesModel != null &&
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
                                'Enter Vehicle'.tr(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: cubit.dropDownVehiclesModel!.data!
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: Text(
                                          "${item.name!} - ${item.platNumber!}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: cubit.assignedVechile,
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
                        CheckboxListTile.adaptive(
                            title: Text(
                              "Status".tr(),
                              style: CustomTextStyle().black16w500,
                            ),
                            value: cubit.driverStatus,
                            onChanged: (e) {
                              cubit.changeDriverStatus();
                            })
                      ],
                    ),

                    vertialSpace(4.h),
                    // next and back buttons
                    if (state is! AddDriverLoadingState &&
                        state is! EditDriverLoadingState)
                      defaultButton(
                        enabled: true,
                        text: widget.isEdit ? "Edit".tr() : "Add".tr(),
                        func: () {
                          if (formKey.currentState!.validate()) {
                            if (widget.isEdit) {
                              cubit.editDriver(widget.driverId);
                            } else {
                              cubit.addDriver();
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
