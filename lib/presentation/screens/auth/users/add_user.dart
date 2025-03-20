import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/constants/countries.dart';
import 'package:template/presentation/shared/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/presentation/shared/buttons.dart';
import 'package:template/presentation/shared/form_fields.dart';
import 'package:template/presentation/shared/spaces.dart';
import 'package:easy_stepper/easy_stepper.dart';
import '../../../../bloc/auth/auth_cubit.dart';
import '../../../../constants/globals.dart';
import '../../../shared/default_breadcrumb.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key, this.isEdit = false, this.userId});
  final bool isEdit;
  final dynamic userId;
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = AuthCubit.get(context);

    cubit.initUserScreen({"isEdit": widget.isEdit, "userId": widget.userId});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AddUserSuccessState || state is EditUserSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);

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
                        items: ["User Managment", "Users", "Add User"]),
                    vertialSpace(3.h),
                    Text(
                      "Add User".tr(),
                      style: CustomTextStyle()
                          .main28w700
                          .copyWith(color: mainColor),
                    ),
                    vertialSpace(3.h),
                    EasyStepper(
                      disableScroll: true,
                      activeStep: cubit.activeStep,
                      lineStyle: const LineStyle(
                        lineLength: 100,
                        lineSpace: 10,
                        lineThickness: 3,
                        lineType: LineType.dashed,
                        defaultLineColor: Colors.grey,
                        finishedLineColor: mainColor,
                      ),
                      activeStepTextColor: Colors.black87,
                      finishedStepTextColor: Colors.black87,
                      internalPadding: 20,
                      showLoadingAnimation: false,
                      stepRadius: 20,
                      showStepBorder: false,
                      steps: [
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 20,
                            backgroundColor: mainColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: cubit.activeStep == 0
                                  ? const Text("1",
                                      style: TextStyle(fontSize: 20))
                                  : const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          customTitle: const Text(
                            'Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        EasyStep(
                          customStep: CircleAvatar(
                            radius: 20,
                            backgroundColor: cubit.activeStep < 1
                                ? Colors.grey[100]
                                : mainColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: cubit.activeStep < 2
                                  ? const Text("2",
                                      style: TextStyle(fontSize: 20))
                                  : const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          customTitle: const Text(
                            'Roles',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                      /* onStepReached: (index) =>
                          setState(() => activeStep = index), */
                    ),
                    if (cubit.activeStep == 0)
                      Column(
                        children: [
                          defaultFormField(
                            context,
                            isRequired: true,
                            controller: cubit.firstNameController,
                            type: TextInputType.name,
                            title: "First Name".tr(),
                            hint: "Enter First Name".tr(),
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
                            controller: cubit.lastNameController,
                            type: TextInputType.name,
                            title: "Last Name".tr(),
                            hint: "Enter Last Name".tr(),
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
                            controller: cubit.userNameController,
                            type: TextInputType.name,
                            title: "Username".tr(),
                            hint: "Enter Username".tr(),
                            fillColor: Colors.white,
                            borderColor: Colors.grey,
                            validate: (String? s) {
                              if (s!.isEmpty) {
                                return "Username can't be empty".tr();
                              }

                              return null;
                            },
                          ),
                          defaultFormField(
                            context,
                            isRequired: true,
                            controller: cubit.emailController,
                            type: TextInputType.emailAddress,
                            title: "Email".tr(),
                            hint: "Enter Email".tr(),
                            fillColor: Colors.white,
                            borderColor: Colors.grey,
                            validate: (String? s) {
                              if (s!.isEmpty) {
                                return "Email can't be empty".tr();
                              }

                              return null;
                            },
                          ),
                          defaultFormField(
                            context,
                            isRequired: widget.isEdit ? false : true,
                            controller: cubit.passwordController,
                            type: TextInputType.text,
                            title: "Password".tr(),
                            isPassword: true,
                            hint: "Enter Password".tr(),
                            fillColor: Colors.white,
                            borderColor: Colors.grey,
                            validate: (String? s) {
                              if (widget.isEdit) return null;
                              if (s!.isEmpty) {
                                return "Password can't be empty".tr();
                              }
                              if (s.length < 6) {
                                return "Password Must Be More Than 6 characters"
                                    .tr();
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
                        ],
                      ),

                    if (cubit.activeStep == 1)
                      if (cubit.rolesModel != null)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.rolesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final role =
                                cubit.rolesList[index]; // Current role item
                            final roleId = role[
                                "Id"]; // Or any unique identifier for the role
                            final isSelected = cubit.selectedRoles
                                .contains(roleId); // Check if selected

                            return CheckboxListTile.adaptive(
                              title: Text(role["English Name"]),
                              fillColor: MaterialStateProperty.all(mainColor),
                              value: isSelected, // Use dynamic state
                              onChanged: (bool? selected) {
                                if (selected == true) {
                                  cubit
                                      .addRole(roleId); // Add to selected roles
                                } else {
                                  cubit.removeRole(
                                      roleId); // Remove from selected roles
                                }
                              },
                            );
                          },
                        )
                      else
                        const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                    vertialSpace(4.h),
                    // next and back buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: defaultButton(
                            enabled: cubit.activeStep == 0 ? false : true,
                            text: "Back".tr(),
                            func: () {
                              cubit.changeStep(increase: false);
                            },
                          ),
                        ),
                        horizontalSpace(2.w),
                        Expanded(
                          child: defaultButton(
                            enabled: true,
                            text: cubit.activeStep != 0
                                ? widget.isEdit
                                    ? "Edit".tr()
                                    : "Add".tr()
                                : "Next".tr(),
                            func: () {
                              if (cubit.activeStep != 0) {
                                if (formKey.currentState!.validate()) {
                                  if (widget.isEdit) {
                                    cubit.editUser(widget.userId);
                                  } else {
                                    cubit.addNewUser();
                                  }
                                }
                              } else {
                                cubit.changeStep();
                              }
                            },
                          ),
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
