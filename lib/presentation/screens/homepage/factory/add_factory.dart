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

class AddFactory extends StatefulWidget {
  const AddFactory({super.key, this.isEdit = false, this.factoryId});
  final bool isEdit;
  final dynamic factoryId;

  @override
  State<AddFactory> createState() => _AddFactoryState();
}

class _AddFactoryState extends State<AddFactory> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = HomePageCubit.get(context);

    cubit.initFactoryScreen(
        {"isEdit": widget.isEdit, "factoryId": widget.factoryId});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        if (state is AddFactorySuccessState ||
            state is EditFactorySuccessState) {
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
                        items: ["Home", "Factories", "Add Factory"]),
                    vertialSpace(3.h),
                    Text(
                      "Add Factory".tr(),
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
                          controller: cubit.factoryNameController,
                          type: TextInputType.name,
                          title: "Factory Name".tr(),
                          hint: "Enter Factory Name".tr(),
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
                          controller: cubit.factoryCodeController,
                          type: TextInputType.name,
                          title: "Factory code".tr(),
                          hint: "Enter Factory code".tr(),
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
                            value: cubit.factoryStatus,
                            onChanged: (e) {
                              cubit.changeFactoryStatus();
                            })
                      ],
                    ),

                    vertialSpace(4.h),
                    // next and back buttons
                    if (state is! AddFactoryLoadingState &&
                        state is! EditFactoryLoadingState)
                      defaultButton(
                        enabled: true,
                        text: widget.isEdit ? "Edit".tr() : "Add".tr(),
                        func: () {
                          if (formKey.currentState!.validate()) {
                            if (widget.isEdit) {
                              cubit.editFactory(widget.factoryId);
                            } else {
                              cubit.addFactory();
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
