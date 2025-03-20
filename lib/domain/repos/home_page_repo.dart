import 'package:template/domain/api/home_page_api.dart';
import 'package:template/domain/models/customers_model.dart';
import 'package:template/domain/models/sales_deliveries_model.dart';
import 'package:template/domain/models/factory_model.dart';
import 'package:template/domain/models/login_model.dart';
import 'package:template/domain/models/orders_model.dart';
import 'package:template/domain/models/loading_orders_model.dart';
import 'package:template/domain/models/user_model.dart';
import 'package:template/domain/models/vehiclesModel.dart';

import '../models/customer_model.dart';
import '../models/driver_model.dart';
import '../models/driver_trips_model.dart';
import '../models/financial_report_model.dart';
import '../models/main_report_model.dart';
import '../models/products_model.dart';
import '../models/purchase_orders_model.dart';
import '../models/report_model.dart';
import '../models/response_model.dart';
import '../models/sales_quotations_model.dart';
import '../models/transporter_model.dart';
import '../models/unit_price_for_customer_model.dart';

class HomePageRepo {
  final HomePageApi homePageApi;

  HomePageRepo(this.homePageApi);
  Future<LoginModel> login(email, password) async {
    final data = await homePageApi.login(email, password);
    return LoginModel.fromJson(data);
  }

  Future<UserModel> getUserById(id) async {
    final data = await homePageApi.getUserById(id);
    return UserModel.fromJson(data);
  }

  Future<CustomersModel> getCustomers() async {
    final data = await homePageApi.getCustomers();
    return CustomersModel.fromJson(data);
  }

  Future<CustomerModel> getCustomer(id) async {
    final data = await homePageApi.getCustomer(id);
    return CustomerModel.fromJson(data);
  }

  Future<ProductsModel> getProducts() async {
    final data = await homePageApi.getProducts();
    return ProductsModel.fromJson(data);
  }

  Future<VehiclesModel> getVehicles() async {
    final data = await homePageApi.getVehicles();
    return VehiclesModel.fromJson(data);
  }

  Future<OrdersModel> getOrders() async {
    final data = await homePageApi.getOrders();
    return OrdersModel.fromJson(data);
  }

  Future<SalesDeliveriesModel> getSalesDelivery() async {
    final data = await homePageApi.getSalesDelivery();
    return SalesDeliveriesModel.fromJson(data);
  }

  Future<SalesQuotationsModel> getSalesQuotations() async {
    final data = await homePageApi.getSalesQuotations();
    return SalesQuotationsModel.fromJson(data);
  }

  Future<PurchaseOrdersModel> getPurchaseOrders() async {
    final data = await homePageApi.getPurchaseOrders();
    return PurchaseOrdersModel.fromJson(data);
  }

  Future<LoadingOrdersModel> getLoadingOrders() async {
    final data = await homePageApi.getLoadingOrders();
    return LoadingOrdersModel.fromJson(data);
  }

  Future<FactoryModel> getFactories() async {
    final data = await homePageApi.getFactories();
    return FactoryModel.fromJson(data);
  }

  Future<VehiclesModel> getDropDownVechiles() async {
    final data = await homePageApi.getDropDownVechiles();
    return VehiclesModel.fromJson(data);
  }

  Future<TransporterModel> getDropDownTransporters() async {
    final data = await homePageApi.getDropDownTransporters();
    return TransporterModel.fromJson(data);
  }

  Future<DriverModel> getDropDownDrivers() async {
    final data = await homePageApi.getDropDownDrivers();
    return DriverModel.fromJson(data);
  }

  Future<DriverModel> getDrivers() async {
    final data = await homePageApi.getDrivers();
    return DriverModel.fromJson(data);
  }

  Future<TransporterModel> getTransporters() async {
    final data = await homePageApi.getTransporters();
    return TransporterModel.fromJson(data);
  }

  Future<Response> deleteVehicle(dynamic id) async {
    final data = await homePageApi.deleteVehicle(id);

    return Response.fromJson(data);
  }

  Future<Response> deleteDriver(dynamic id) async {
    final data = await homePageApi.deleteDriver(id);

    return Response.fromJson(data);
  }

  Future<Response> deleteFactory(dynamic id) async {
    final data = await homePageApi.deleteFactory(id);

    return Response.fromJson(data);
  }

  Future<Response> deleteTransporter(dynamic id) async {
    final data = await homePageApi.deleteTransporter(id);

    return Response.fromJson(data);
  }

  Future<DriverTripsModel> getDriverTrips() async {
    final data = await homePageApi.getDriverTrips();
    return DriverTripsModel.fromJson(data);
  }

  Future<Response> addFactory(Map<String, dynamic> data) async {
    final response = await homePageApi.addFactory(data);

    return Response.fromJson(response);
  }

  Future<dynamic> editFactory(Map<String, dynamic> data) async {
    final response = await homePageApi.editFactory(data);

    return response;
  }

  Future<Response> addVehicle(Map<String, dynamic> data) async {
    final response = await homePageApi.addVehicle(data);

    return Response.fromJson(response);
  }

  Future<dynamic> editVehicle(Map<String, dynamic> data) async {
    final response = await homePageApi.editVehicle(data);

    return response;
  }

  Future<dynamic> addDriver(Map<String, dynamic> data) async {
    final response = await homePageApi.addDriver(data);

    return response;
  }

  Future<dynamic> editDriver(Map<String, dynamic> data) async {
    final response = await homePageApi.editDriver(data);

    return response;
  }

  Future<dynamic> addTransporter(Map<String, dynamic> data) async {
    final response = await homePageApi.addTransporter(data);

    return response;
  }

  Future<dynamic> editTransporter(Map<String, dynamic> data) async {
    final response = await homePageApi.editTransporter(data);

    return response;
  }

  Future<Response> completeLoadingOrder(Map<String, dynamic> data) async {
    final response = await homePageApi.completeLoadingOrder(data);

    return Response.fromJson(response);
  }

  Future<UnitPriceForCustomerModel> getUnitPriceForCustomer(
      Map<String, dynamic> data) async {
    final response = await homePageApi.getUnitPriceForCustomer(data);

    return UnitPriceForCustomerModel.fromJson(response);
  }

  Future<ReportModel> getAccountStatement(Map<String, dynamic> data) async {
    final response = await homePageApi.getAccountStatement(data);

    return ReportModel.fromJson(response);
  }

  Future<ReportModel> getSalesItemsReport(Map<String, dynamic> data) async {
    final response = await homePageApi.getSalesItemsReport(data);

    return ReportModel.fromJson(response);
  }

  Future<FinancialReportModel> getFinancialReport(
      Map<String, dynamic> data) async {
    final response = await homePageApi.getFinancialReport(data);

    return FinancialReportModel.fromJson(response);
  }

  Future<MainReportModel> getMainReport() async {
    final data = await homePageApi.getMainReport();
    return MainReportModel.fromJson(data);
  }

  Future<dynamic> editSalesQuotation(Map<String, dynamic> data) async {
    final response = await homePageApi.editSalesQuotation(data);

    return response;
  }

  Future<dynamic> acceptSalesQuotation(Map<String, dynamic> data) async {
    final response = await homePageApi.acceptSalesQuotation(data);

    return response;
  }

  Future<dynamic> rejectSalesQuotation(Map<String, dynamic> data) async {
    final response = await homePageApi.rejectSalesQuotation(data);

    return response;
  }

  Future<dynamic> addPurchaseOrder(Map<String, dynamic> data) async {
    final response = await homePageApi.addPurchaseOrder(data);

    return response;
  }

  /* Future<ProductsModel> getCities() async {
    final data = await homePageApi.getCities();
    return ProductsModel.fromJson(data);
  }

  Future<ProductsModel> getWarehouses() async {
    final data = await homePageApi.getWarehouses();
    return ProductsModel.fromJson(data);
  } */
}
