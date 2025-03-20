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

import '../../../../constants/globals.dart';
import '../../../shared/buttons.dart';
import '../../../shared/card_tile.dart';
import '../../../shared/default_breadcrumb.dart';
import '../../../shared/visibility_widget.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final MenuItems menu = MenuItems(items: []);

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
                  const DefaultBreadCrumb(items: ["Home", "Products"]),
                  vertialSpace(3.h),
                  Text(
                    "Products".tr(),
                    style:
                        CustomTextStyle().main28w700.copyWith(color: mainColor),
                  ),
                  vertialSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSearchTextField(
                          onChanged: (e) {
                            cubit.searchProducts();
                          },
                          controller: cubit.productsSearchController,
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
                      HomePageVisibilityWidget(
                        cubit: cubit,
                        type: "products",
                      ),
                    ],
                  ),
                  /* vertialSpace(3.h),
                  defaultButtonWithIcon(
                      text: "Add Product".tr(), func: () {}, icon: Icons.add), */
                  vertialSpace(3.h),
                  if (cubit.productsModel != null)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.productsSearchController.text.isEmpty
                          ? cubit.productsList.length
                          : cubit.searchProductsList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return vertialSpace(2.h);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var data = cubit.productsSearchController.text.isEmpty
                            ? cubit.productsList[index]
                            : cubit.searchProductsList[index];
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
                                /* Row(
                                  children: [
                                    if (data["Image"] != null)
                                      CircleAvatar(
                                        radius: 5.w,
                                        backgroundImage: NetworkImage(
                                            "$baseUrl${data["Image"].replaceAll("\\", "/")}"),
                                      ),
                                    const Spacer(),
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
                                          if (value!.text ==
                                              "Deactivated User") {
                                            print("dect u");
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
                                vertialSpace(4.h), */
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
