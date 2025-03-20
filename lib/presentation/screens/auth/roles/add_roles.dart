import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/presentation/shared/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/presentation/shared/buttons.dart';
import 'package:template/presentation/shared/form_fields.dart';
import 'package:template/presentation/shared/spaces.dart';
import '../../../../bloc/auth/auth_cubit.dart';
import '../../../../constants/globals.dart';
import '../../../shared/default_breadcrumb.dart';

class AddRole extends StatefulWidget {
  const AddRole({super.key, this.isEdit = false, this.roleId});
  final bool isEdit;
  final dynamic roleId;

  @override
  State<AddRole> createState() => _AddRoleState();
}

class _AddRoleState extends State<AddRole> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = AuthCubit.get(context);

    cubit.initRoleScreen({"isEdit": widget.isEdit, "roleId": widget.roleId});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AddRoleSuccessState || state is EditRoleSuccessState) {
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
                        items: ["User Managment", "Roles", "Add Role"]),
                    vertialSpace(3.h),
                    Text(
                      "Add Role".tr(),
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
                          controller: cubit.englishRoleNameController,
                          type: TextInputType.name,
                          title: "English Role Name".tr(),
                          hint: "Enter English Name".tr(),
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
                          controller: cubit.arabicRoleNameController,
                          type: TextInputType.name,
                          title: "Arabic Role Name".tr(),
                          hint: "Enter Arabic Name".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Name can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                      ],
                    ),

                    vertialSpace(4.h),
                    // next and back buttons
                    defaultButton(
                      enabled: true,
                      text: widget.isEdit ? "Edit".tr() : "Add".tr(),
                      func: () {
                        if (formKey.currentState!.validate()) {
                          if (widget.isEdit) {
                            cubit.editRole(widget.roleId);
                          } else {
                            cubit.addNewRole();
                          }
                        }
                      },
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
