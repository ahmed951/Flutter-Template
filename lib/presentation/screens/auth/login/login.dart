import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:template/bloc/auth/auth_cubit.dart';
import 'package:template/constants/global_functions.dart';
import 'package:template/constants/strings.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/presentation/shared/spaces.dart';

import '../../../../constants/globals.dart';
import '../../../../domain/helpers/shared_prefs.dart';
import '../../../shared/buttons.dart';
import '../../../shared/form_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          debugPrint(state.loginModel.toJson().toString());

          SharedPrefsHelpers.saveData(
              key: "roles", value: state.loginModel.roles);
          SharedPrefsHelpers.saveData(
              key: "permissions", value: state.loginModel.permissions);

          SharedPrefsHelpers.saveData(
              key: "token", value: state.loginModel.token);
          SharedPrefsHelpers.saveData(
              key: "userId", value: state.loginModel.id);
          SharedPrefsHelpers.saveData(
              key: "customerId", value: state.loginModel.customerId);
          userPermissionsList = state.loginModel.permissions!;
          roles = state.loginModel.roles!;
          userToken = state.loginModel.token!;

          pushReplaceNavigate(context, homePageRoute);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: defaultPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        vertialSpace(15.h),
                        Image.asset(
                          "assets/images/splashLogo.png",
                          width: 100,
                          height: 100,
                        ),
                        vertialSpace(2.h),
                        Text(
                          "Welcome back".tr(),
                          style: CustomTextStyle().black16w600,
                        ),
                        vertialSpace(1.h),
                        Text(
                          "Sign in with your credentials below".tr(),
                          style: CustomTextStyle().grey14w400,
                        ),
                        vertialSpace(4.h),
                        defaultFormField(
                          context,
                          hint: "Username".tr(),
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          borderWidth: 1,
                          type: TextInputType.text,
                          prefix: Icons.person,
                          controller: cubit.loginEmailController,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Username can't be empty".tr();
                            }

                            return null;
                          },
                        ),
                        vertialSpace(2.h),
                        defaultFormField(
                          context,
                          hint: "Password".tr(),
                          type: TextInputType.visiblePassword,
                          suffix: cubit.suffix,
                          fillColor: Colors.white,
                          borderColor: Colors.grey,
                          borderWidth: 1,
                          suffixPressed: () {
                            cubit.changeVisibility();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              /*  cubit.userLogin(emailController.text,
                                    passwordController.text); */
                            }
                          },
                          prefix: Icons.lock,
                          isPassword: !cubit.isVisible,
                          controller: cubit.loginPasswordController,
                          validate: (String? s) {
                            if (s!.isEmpty) {
                              return "Password can't be empty".tr();
                            }
                            return null;
                          },
                        ),
                        vertialSpace(2.h),
                        if (state is! LoginLoadingState)
                          defaultButton(
                              text: "LOGIN".tr(),
                              func: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.login();
                                }
                              })
                        else
                          const Center(
                              child: CircularProgressIndicator.adaptive()),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
