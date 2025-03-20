import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

import '../../constants/global_functions.dart';
import '../../constants/strings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Accordion(
              paddingListBottom: 0,
              headerBackgroundColor: Colors.transparent,
              headerBorderColor: Colors.white,
              headerBorderColorOpened: greyColor,
              headerBorderWidth: 1,
              headerBackgroundColorOpened: Colors.white,
              contentBackgroundColor: Colors.white,
              contentBorderColor: Colors.transparent,
              contentBorderWidth: 3,
              contentHorizontalPadding: 20,
              scaleWhenAnimating: false,
              openAndCloseAnimation: true,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                if (havePermissions(["Permissions.UserManagment.Read"]))
                  AccordionSection(
                    isOpen: false,
                    contentVerticalPadding: 5,
                    leftIcon: const Icon(Icons.person, color: mainColor),
                    header: Text(
                      'User Management'.tr(),
                      textAlign: TextAlign.start,
                    ),
                    content: Column(
                      children: [
                        if (havePermissions([
                          "Permissions.UserManagment.Read",
                          "Permissions.User.Read"
                        ]))
                          ListTile(
                            title: Text("Users".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, usersRoute);
                            },
                          ),
                        if (havePermissions([
                          "Permissions.UserManagment.Read",
                          "Permissions.Role.Read"
                        ]))
                          ListTile(
                            title: Text("Roles".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, rolesRoute);
                            },
                          ),
                      ],
                    ),
                  ),
                if (havePermissions(["Permissions.MasterData.Read"]))
                  AccordionSection(
                    isOpen: false,
                    contentVerticalPadding: 5,
                    leftIcon: const Icon(Icons.dashboard, color: mainColor),
                    header: Text(
                      'Master Data'.tr(),
                      textAlign: TextAlign.start,
                    ),
                    content: Column(
                      children: [
                        if (havePermissions(["Permissions.Customer.Read"]))
                          ListTile(
                            title: Text("Customers".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, customersRoute);
                            },
                          ),
                        if (havePermissions(["Permissions.Product.Read"]))
                          ListTile(
                            title: Text("Products".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, productsRoute);
                            },
                          ),
                        if (havePermissions(["Permissions.Vehicle.Read"]))
                          ListTile(
                            title: Text("Vehicles".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, vehiclesRoute);
                            },
                          ),
                        if (havePermissions(["Permissions.Factory.Read"]))
                          ListTile(
                            title: Text("Factories".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, factoriesRoute);
                            },
                          ),
                        if (havePermissions(["Permissions.Driver.Read"]))
                          ListTile(
                            title: Text("Drivers".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, driversRoute);
                            },
                          ),
                        if (havePermissions(["Permissions.Transporter.Read"]))
                          ListTile(
                            title: Text("Transporters".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, transporterRoute);
                            },
                          ),
                      ],
                    ),
                  ),
                if (havePermissions(["Permissions.Transactions.Read"]))
                  AccordionSection(
                      isOpen: false,
                      contentVerticalPadding: 5,
                      leftIcon: const Icon(Icons.input, color: mainColor),
                      header: Text(
                        'Transactions'.tr(),
                        textAlign: TextAlign.start,
                      ),
                      content: Column(
                        children: [
                          if (havePermissions(["Permissions.SalesOrder.Read"]))
                            ListTile(
                              title: Text("Sales Orders".tr()),
                              onTap: () {
                                pop(context);
                                pushNavigate(context, ordersRoute);
                              },
                            ),
                          if (havePermissions(
                              ["Permissions.SalesQuotation.Read"]))
                            ListTile(
                              title: Text("Sales Quotation".tr()),
                              onTap: () {
                                pop(context);
                                pushNavigate(context, salesQuotationRoute);
                              },
                            ),
                          if (havePermissions(
                              ["Permissions.PurchaseOrder.Read"]))
                            ListTile(
                              title: Text("Purchase Orders".tr()),
                              onTap: () {
                                pop(context);
                                pushNavigate(context, purchaseOrdersRoute);
                              },
                            ),
                          if (havePermissions(
                              ["Permissions.SalesDelivery.Read"]))
                            ListTile(
                              title: Text("Sales Delivery".tr()),
                              onTap: () {
                                pop(context);
                                pushNavigate(context, salesDeliveryRoute);
                              },
                            ),
                          if (havePermissions(
                              ["Permissions.LoadingOrder.Read"]))
                            ListTile(
                              title: Text("Loading Orders".tr()),
                              onTap: () {
                                pop(context);
                                pushNavigate(context, loadingOrdersRoute);
                              },
                            ),
                        ],
                      )),
                if (havePermissions(["Permissions.Report.Read"]))
                  AccordionSection(
                    isOpen: false,
                    contentVerticalPadding: 5,
                    leftIcon: const Icon(Icons.assessment, color: mainColor),
                    header: Text(
                      'Reports'.tr(),
                      textAlign: TextAlign.start,
                    ),
                    content: Column(
                      children: [
                        if (havePermissions(["Permissions.Report.Read"]))
                          ListTile(
                            title: Text("Financial Statements".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(context, financialReportRoute);
                            },
                          ),
                        if (havePermissions(["Permissions.Report.Read"]))
                          ListTile(
                            title: Text("Detailed Account Statement".tr()),
                            onTap: () {
                              pop(context);
                              pushNavigate(
                                  context, accountStatementReportRoute);
                            },
                          ),
                        ListTile(
                          title: Text("Sales Details for Items".tr()),
                          onTap: () {
                            pop(context);
                            pushNavigate(context, salesDetailsReportRoute);
                          },
                        ),
                      ],
                    ),
                  ),
              ]),
          if (havePermissions(["Permissions.DriverTrips.Read"]))
            ListTile(
              title: Text("Driver Trips".tr()),
              onTap: () {
                pop(context);
                pushNavigate(context, driverTripsRoute);
              },
            ),
          if (havePermissions(["Permissions.Tracking.Read"]))
            ListTile(
              title: Text("Tracking Orders".tr()),
              leading: const Icon(Icons.track_changes, color: mainColor),
              minLeadingWidth: 10,
              onTap: () {
                pop(context);
                pushNavigate(context, loadingOrdersRoute);
              },
            ),

          /* ListTile(
            title: const Text("Cities"),
            onTap: () {
              pop(context);
              pushNavigate(context, citiesRoute);
            },
          ), */
          /* ListTile(
            title: const Text("Warehouses"),
            onTap: () {
              pop(context);
              pushNavigate(context, warehousesRoute);
            },
          ), */
        ],
      ),
    );
  }
}
