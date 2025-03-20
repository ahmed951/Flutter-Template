import 'package:flutter/foundation.dart';

import 'globals.dart';

String baseUrl = isServer
    ? "https://mowakebpreprodbackend.cloudiax.com/"
    : kIsWeb
        ? "http://127.0.0.1:7180/"
        : "https://10.0.2.2:7180/";

const String loginApi = "api/Account/login";
const String getUserApi = "api/User";
const String getUsersApi = "api/User/GetAll/true";
const String getRolesApi = "api/Role";
const String getCustomersApi = "api/Customer";
const String getProductsApi = "api/Product";
const String getVehiclesApi = "api/Vehicle";
const String getOrdersApi = "api/SalesOrder";
const String getSalesDeliveryApi = "api/SalesDelivery";
const String getLoadingOrdersApi = "api/LoadingOrder";
const String getFactoriesApi = "api/Factory/GetAll?isActive=1";
const String deleteUserApi = "api/User/delete";
const String deleteRoleApi = "api/Role/delete";
const String deleteVehicleApi = "api/Vehicle";
const String deleteFactoryApi = "api/Factory";
const String deleteTransporterApi = "api/Transporter";
const String addUserApi = "api/User/Add";
const String editUserApi = "api/User/Edit";
const String addRoleApi = "api/Role";
const String editRoleApi = "api/Role/{id}/Update";
const String deactivateUserApi = "api/user/ChangeStatus";
const String driverTripsApi = "api/LoadingOrder/driverTrips";
const String getDriversApi = "api/Driver";
const String getTransporterApi = "api/Transporter";

const String addFactoryApi = "api/Factory/Add";
const String editFactoryApi = "api/Factory";
const String addDriverApi = "api/Driver/Add";
const String editDriverApi = "api/Driver";
const String addTransporterApi = "api/Transporter/Add";
const String addVehicleApi = "api/Vehicle/Add";
const String editTransporterApi = "api/Transporter";
const String editVehicleApi = "api/Vehicle";
const String deleteDriverApi = "api/Driver";
const String getDropdownVehiclesApi = "api/dropdown/vehicles";
const String getDropdownDriversApi = "api/dropdown/drivers";
const String getDropdownTransportersApi = "api/dropdown/transporters";
const String completeLoadingOrderApi = "api/LoadingOrder/driverTrip/complete";
const String mainReportApi = "api/Dashboard/MainReport";
const String getSalesQuotationsApi = "api/SalesQuotation";
const String getPurchaseOrdersApi = "api/PurchaseOrder";
const String editSalesQuotationsApi = "api/SalesQuotation";
const String editPurchaseOrderApi = "api/PurchaseOrder";
const String acceptSalesQuotationsApi = "api/SalesQuotation/accept";
const String rejectSalesQuotationsApi = "api/SalesQuotation/reject";
const String unitPriceForCustomerApi = "api/PurchaseOrder/UnitPriceForCustomer";
const String addPurchaseOrderApi = "api/PurchaseOrder/Add";
const String accountStatementApi = "api/Report/Customer/CustomerAccountDetails";
const String salesItemsReportApi = "api/Report/Customer/CustomerSalesDetails";
const String financialReportApi = "api/Customer/GetCustomerFinancialStatment";
/* const String getCitiesApi = "api/Cities";
const String getWarehousesApi = "api/Warehouses"; */

/* Routes */

const String loginRoute = "/login";
const String homePageRoute = "/homepage";
const String usersRoute = "/Users";
const String rolesRoute = "/roles";
const String customersRoute = "/customers";
const String productsRoute = "/products";
const String vehiclesRoute = "/vehicles";
const String ordersRoute = "/orders";
const String salesDeliveryRoute = "/salesDelivery";
const String salesQuotationRoute = "/salesQuotation";
const String purchaseOrdersRoute = "/purchaseOrder";
const String loadingOrdersRoute = "/loading_orders";
const String driverTripsRoute = "/driver_trips";
const String factoriesRoute = "/factories";
const String addUserRoute = "/add_user";
const String addRoleRoute = "/add_role";
const String addFactoryRoute = "/add_factory";
const String driversRoute = "/add_factory";
const String transporterRoute = "/transporter";
const String addDriverRoute = "/add_driver";
const String addTransporterRoute = "/add_transporter";
const String addVehicleRoute = "/add_vehicle";
const String viewSalesDeliveryRoute = "/view_sales_delivery";
const String viewLoadingOrderRoute = "/view_loading_order";
const String viewSalesOrderRoute = "/view_sales_order";
const String viewSalesQuotationRoute = "/view_sales_quotation";
const String viewPurchaseOrderRoute = "/view_purchase_order";
const String financialStatementsRoute = "/financial_statements";
const String accountStatementReportRoute = "/account_statement_report";
const String salesDetailsReportRoute = "/sales_details_report";
const String financialReportRoute = "/financial_report";
/* const String citiesRoute = "/Dropdown/Cities";
const String warehousesRoute = "/warehouses"; */
