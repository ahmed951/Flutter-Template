import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:template/bloc/auth/auth_cubit.dart';
import 'package:template/presentation/screens/shared/spaces.dart';

import '../../../constants/globals.dart';
import '../shared/buttons.dart';
import '../shared/form_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: defaultPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/splashLogo.png",
                        width: 100,
                        height: 100,
                      ),
                      vertialSpace(2.h),
                      Text("Welcome back".tr()),
                      Text("Sign in with your credentials below".tr()),
                      vertialSpace(4.h),
                      defaultFormField(
                        context,
                        hint: "Email".tr(),
                        fillColor: Colors.white,
                        borderColor: Colors.grey,
                        borderWidth: 1,
                        type: TextInputType.emailAddress,
                        prefix: Icons.email_rounded,
                        controller: cubit.loginEmailController,
                        validate: (String? s) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(s!);

                          if (s.isEmpty) {
                            return "Email can't be empty".tr();
                          }
                          if (!emailValid) {
                            return "Email is not valid".tr();
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
                        const Center(child: CircularProgressIndicator()),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
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
