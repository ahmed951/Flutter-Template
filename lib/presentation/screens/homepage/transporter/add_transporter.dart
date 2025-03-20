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

class AddTransporter extends StatefulWidget {
  const AddTransporter({super.key, this.isEdit = false, this.transporterId});
  final bool isEdit;
  final dynamic transporterId;

  @override
  State<AddTransporter> createState() => _AddTransporterState();
}

class _AddTransporterState extends State<AddTransporter> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = HomePageCubit.get(context);

    cubit.initTransporterScreen(
        {"isEdit": widget.isEdit, "transporterId": widget.transporterId});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        if (state is AddTransporterSuccessState ||
            state is EditTransporterSuccessState) {
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
                        items: ["Home", "Transporters", "Add Transporter"]),
                    vertialSpace(3.h),
                    Text(
                      "Add Transporter".tr(),
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
                          controller: cubit.transporterNameController,
                          type: TextInputType.name,
                          title: "Transporter Name".tr(),
                          hint: "Enter Transporter Name".tr(),
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
                          controller: cubit.transporterCodeController,
                          type: TextInputType.name,
                          title: "Transporter code".tr(),
                          hint: "Enter Transporter code".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        // check box for status
                        CheckboxListTile.adaptive(
                            title: Text(
                              "Status".tr(),
                              style: CustomTextStyle().black16w500,
                            ),
                            value: cubit.transporterStatus,
                            onChanged: (e) {
                              cubit.changeTransporterStatus();
                            })
                      ],
                    ),

                    vertialSpace(4.h),
                    // next and back buttons
                    if (state is! AddTransporterLoadingState &&
                        state is! EditTransporterLoadingState)
                      defaultButton(
                        enabled: true,
                        text: widget.isEdit ? "Edit".tr() : "Add".tr(),
                        func: () {
                          if (formKey.currentState!.validate()) {
                            if (widget.isEdit) {
                              cubit.editTransporter(widget.transporterId);
                            } else {
                              cubit.addTransporter();
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
