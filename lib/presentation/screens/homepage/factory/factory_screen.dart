import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/text_styles.dart';
import 'package:template/domain/models/menu_items.dart';
import 'package:template/presentation/shared/app_bar.dart';
import 'package:template/presentation/shared/drawer.dart';
import 'package:template/presentation/shared/spaces.dart';

import '../../../../constants/global_functions.dart';
import '../../../../constants/globals.dart';
import '../../../../constants/strings.dart';
import '../../../shared/buttons.dart';
import '../../../shared/card_tile.dart';
import '../../../shared/default_breadcrumb.dart';
import '../../../shared/dialogs.dart';
import '../../../shared/visibility_widget.dart';

class FactoryScreen extends StatelessWidget {
  FactoryScreen({super.key});

  final MenuItems menu = MenuItems(
      items: [const MenuItem(text: 'Edit'), const MenuItem(text: 'Delete')]);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(context),
          drawer: const CustomDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DefaultBreadCrumb(items: ["Home", "Factories"]),
                  vertialSpace(3.h),
                  Text(
                    "Factories".tr(),
                    style:
                        CustomTextStyle().main28w700.copyWith(color: mainColor),
                  ),
                  vertialSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSearchTextField(
                          onChanged: (e) {
                            cubit.searchFactories();
                          },
                          controller: cubit.factoriesSearchController,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      horizontalSpace(3.w),
                      if (showFilter)
                        defaultIconButton(
                          icon: Icons.filter_alt,
                          func: () {
                            print("filter");
                          },
                        ),
                      horizontalSpace(3.w),
                      HomePageVisibilityWidget(cubit: cubit, type: "factory"),
                    ],
                  ),
                  vertialSpace(3.h),
                  defaultButtonWithIcon(
                      text: "Add Factory".tr(),
                      func: () {
                        pushNavigate(context, addFactoryRoute, arguments: {
                          "context": context,
                          "isEdit": false
                        }).then((value) => cubit.getFactories());
                      },
                      icon: Icons.add),
                  vertialSpace(3.h),
                  if (cubit.factoriesModel != null &&
                      state is! GetFactoriesLoadingState)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.factoriesSearchController.text.isEmpty
                          ? cubit.factoriesList.length
                          : cubit.searchFactoriesList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return vertialSpace(2.h);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var data = cubit.factoriesSearchController.text.isEmpty
                            ? cubit.factoriesList[index]
                            : cubit.searchFactoriesList[index];
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: defaultPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        customButton: const Icon(
                                          Icons.more_vert_rounded,
                                          color: greyColor,
                                          size: 30,
                                        ),
                                        items: menu.items
                                            .map(
                                              (item) =>
                                                  DropdownMenuItem<MenuItem>(
                                                value: item,
                                                child: menu.buildItem(item),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          if (value!.text == "Delete".tr()) {
                                            print("delete ${data["Id"]}");
                                            deleteDialog(context,
                                                type: "factory", func: () {
                                              cubit.deleteFactory(data["Id"]);
                                            });
                                          }
                                          if (value.text == "Edit".tr()) {
                                            pushNavigate(
                                                context, addFactoryRoute,
                                                arguments: {
                                                  "context": context,
                                                  "isEdit": true,
                                                  "factoryId": data["Id"]
                                                }).then((value) {
                                              cubit.getFactories();
                                            });
                                          }
                                        },
                                        dropdownStyleData: DropdownStyleData(
                                          width: 160,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          offset: const Offset(-100, -20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                vertialSpace(4.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: data.entries.map((entry) {
                                    return CardTile(
                                      cubit: cubit,
                                      title: entry.key,
                                      data: entry.value.toString(),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
