import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';

import '../../bloc/auth/auth_cubit.dart';
import 'buttons.dart';

class AuthVisibilityWidget extends StatelessWidget {
  const AuthVisibilityWidget({
    super.key,
    required this.cubit,
    this.type = "users",
  });

  final AuthCubit cubit;
  final String type;

  @override
  Widget build(BuildContext context) {
    var list = type == "users" ? cubit.usersItems : cubit.rolesItems;
    return Center(
      child: DropdownButton2<String>(
        isExpanded: true,
        customButton: defaultIconButton(icon: Icons.visibility, func: null),
        dropdownStyleData: const DropdownStyleData(
          width: 160,
          padding: EdgeInsets.symmetric(vertical: 6),
          offset: Offset(0, 8),
        ),
        items: list.map((item) {
          return DropdownMenuItem(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,

            child: StatefulBuilder(
              builder: (context, menuSetState) {
                return InkWell(
                  onTap: () {
                    cubit.changeVisibleItems(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    //setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        if (cubit.selectedItems.contains(item))
                          const Icon(Icons.check_box_outlined)
                        else
                          const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: cubit.selectedItems.isEmpty ? null : cubit.selectedItems.last,
        onChanged: (value) {},

        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(left: 16, right: 8),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

class HomePageVisibilityWidget extends StatelessWidget {
  const HomePageVisibilityWidget({
    super.key,
    required this.cubit,
    this.type = "customers",
  });

  final HomePageCubit cubit;
  final String type;

  @override
  Widget build(BuildContext context) {
    List<String> list = [];
    if (type == "customers") {
      list = cubit.customersItems;
    } else if (type == "products") {
      list = cubit.productsItems;
    } else if (type == "vehicles") {
      list = cubit.vehiclesItems;
    } else if (type == "orders") {
      list = cubit.ordersItems;
    } else if (type == "salesDelivery") {
      list = cubit.salesDeliveryItems;
    } else if (type == "loadingOrders") {
      list = cubit.loadingOrdersItems;
    } else if (type == "driverTrips") {
      list = cubit.driverTripsItems;
    } else if (type == "factory") {
      list = cubit.factoryItems;
    } else if (type == "driver") {
      list = cubit.driversItems;
    } else if (type == "transporter") {
      list = cubit.transportersItems;
    } else if (type == "salesQuotations") {
      list = cubit.salesQuotationsItems;
    } else if (type == "purchaseOrders") {
      list = cubit.purchaseOrdersItems;
    }
    return Center(
      child: DropdownButton2<String>(
        isExpanded: true,
        customButton: defaultIconButton(icon: Icons.visibility, func: null),
        dropdownStyleData: const DropdownStyleData(
          width: 160,
          padding: EdgeInsets.symmetric(vertical: 6),
          offset: Offset(0, 8),
        ),
        items: list.map((item) {
          return DropdownMenuItem(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,

            child: StatefulBuilder(
              builder: (context, menuSetState) {
                return InkWell(
                  onTap: () {
                    cubit.changeVisibleItems(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    //setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        if (cubit.selectedItems.contains(item))
                          const Icon(Icons.check_box_outlined)
                        else
                          const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: cubit.selectedItems.isEmpty ? null : cubit.selectedItems.last,
        onChanged: (value) {},

        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(left: 16, right: 8),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
