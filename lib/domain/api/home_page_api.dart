import 'package:template/domain/api/app_api.dart';
import '../../constants/strings.dart';

class HomePageApi {
  final AppApi appApi = AppApi();
  Future<Map<String, dynamic>> login(email, password) async {
    return appApi.postApiData(loginApi, {"email": email, "password": password});
  }

  Future<Map<String, dynamic>> getUserById(id) async {
    return appApi.getApiData("$getUserApi/$id");
  }

  Future<Map<String, dynamic>> getCustomers() async {
    return appApi.getApiData(getCustomersApi);
  }

  Future<Map<String, dynamic>> getCustomer(id) async {
    return appApi.getApiData("$getCustomersApi/$id");
  }

  Future<Map<String, dynamic>> getProducts() async {
    return appApi.getApiData(getProductsApi);
  }

  Future<Map<String, dynamic>> getVehicles() async {
    return appApi.getApiData(getVehiclesApi);
  }

  Future<Map<String, dynamic>> getOrders() async {
    return appApi.getApiData(getOrdersApi);
  }

  Future<Map<String, dynamic>> getSalesDelivery() async {
    return appApi.getApiData(getSalesDeliveryApi);
  }

  Future<Map<String, dynamic>> getSalesQuotations() async {
    return appApi.getApiData(getSalesQuotationsApi);
  }

  Future<Map<String, dynamic>> getPurchaseOrders() async {
    return appApi.getApiData(getPurchaseOrdersApi);
  }

  Future<Map<String, dynamic>> getLoadingOrders() async {
    return appApi.getApiData(getLoadingOrdersApi);
  }

  Future<Map<String, dynamic>> getFactories() async {
    return appApi.getApiData(getFactoriesApi);
  }

  Future<Map<String, dynamic>> getDrivers() async {
    return appApi.getApiData(getDriversApi);
  }

  Future<Map<String, dynamic>> getTransporters() async {
    return appApi.getApiData(getTransporterApi);
  }

  Future<Map<String, dynamic>> getDropDownVechiles() async {
    return appApi.getApiData(getDropdownVehiclesApi);
  }

  Future<Map<String, dynamic>> getDropDownTransporters() async {
    return appApi.getApiData(getDropdownTransportersApi);
  }

  Future<Map<String, dynamic>> getDropDownDrivers() async {
    return appApi.getApiData(getDropdownDriversApi);
  }

  Future<Map<String, dynamic>> getMainReport() async {
    return appApi.getApiData(mainReportApi, query: {
      "from": "2024-01-01",
      "to": "2026-12-31",
    });
  }

  Future<dynamic> deleteVehicle(dynamic id) async {
    return appApi.deleteApiData(deleteVehicleApi, id: id);
  }

  Future<dynamic> deleteDriver(dynamic id) async {
    return appApi.deleteApiData(deleteDriverApi, id: id);
  }

  Future<dynamic> deleteFactory(dynamic id) async {
    return appApi.deleteApiData(deleteFactoryApi, id: id);
  }

  Future<dynamic> deleteTransporter(dynamic id) async {
    return appApi.deleteApiData(deleteTransporterApi, id: id);
  }

  Future<dynamic> addFactory(Map<String, dynamic> data) async {
    return appApi.postApiData(addFactoryApi, data);
  }

  Future<dynamic> editFactory(Map<String, dynamic> data) async {
    return appApi.patchApiData("$editFactoryApi/${data["id"]}", data);
  }

  Future<dynamic> addDriver(Map<String, dynamic> data) async {
    return appApi.postApiData(addDriverApi, data, isForm: true);
  }

  Future<dynamic> editDriver(Map<String, dynamic> data) async {
    return appApi.patchApiData("$editDriverApi/${data["id"]}", data,
        isForm: true);
  }

  Future<dynamic> addTransporter(Map<String, dynamic> data) async {
    return appApi.postApiData(
      addTransporterApi,
      data,
    );
  }

  Future<dynamic> editTransporter(Map<String, dynamic> data) async {
    return appApi.patchApiData(
      "$editTransporterApi/${data["id"]}",
      data,
    );
  }

  Future<dynamic> addVehicle(Map<String, dynamic> data) async {
    return appApi.postApiData(
      addVehicleApi,
      data,
    );
  }

  Future<dynamic> editVehicle(Map<String, dynamic> data) async {
    return appApi.patchApiData(
      "$editVehicleApi/${data["id"]}",
      data,
    );
  }

  Future<dynamic> editSalesQuotation(Map<String, dynamic> data) async {
    return appApi.patchApiData("$editSalesQuotationsApi/${data["id"]}", data,
        isForm: true);
  }

  Future<dynamic> acceptSalesQuotation(Map<String, dynamic> data) async {
    return appApi.postApiData(
      "$acceptSalesQuotationsApi/${data["id"]}",
      data,
    );
  }

  Future<dynamic> rejectSalesQuotation(Map<String, dynamic> data) async {
    return appApi.postApiData(
      "$rejectSalesQuotationsApi/${data["id"]}",
      data,
    );
  }

  Future<Map<String, dynamic>> getDriverTrips() async {
    return appApi.getApiData(driverTripsApi);
  }

  Future<Map<String, dynamic>> getUnitPriceForCustomer(
      Map<String, dynamic> data) async {
    return appApi.getApiData(unitPriceForCustomerApi, query: {
      "customer_id": data["customerId"],
      "product_id": data["productId"],
      "customerAddressId": data["customerAddressId"]
    });
  }

  Future<Map<String, dynamic>> getAccountStatement(
      Map<String, dynamic> data) async {
    return appApi.getApiData(accountStatementApi, query: {
      "customerId": data["customerId"],
      "dateFrom": data["dateFrom"],
      "dateTo": data["dateTo"]
    });
  }

  Future<Map<String, dynamic>> getFinancialReport(
      Map<String, dynamic> data) async {
    print(data);
    return appApi.getApiData("$financialReportApi/${data["customerId"]}",
        query: {"dateFrom": data["dateFrom"], "dateTo": data["dateTo"]});
  }

  Future<Map<String, dynamic>> getSalesItemsReport(
      Map<String, dynamic> data) async {
    return appApi.getApiData(salesItemsReportApi, query: {
      "customerId": data["customerId"],
      "dateFrom": data["dateFrom"],
      "dateTo": data["dateTo"],
      "itemTo": data["itemTo"],
      "itemFrom": data["itemFrom"],
    });
  }

  Future<Map<String, dynamic>> completeLoadingOrder(
      Map<String, dynamic> data) async {
    return appApi.postApiData("$completeLoadingOrderApi/${data["id"]}", data,
        isForm: true);
  }

  Future<Map<String, dynamic>> addPurchaseOrder(
      Map<String, dynamic> data) async {
    return appApi.postApiData(addPurchaseOrderApi, data, isForm: true);
  }

  /* Future<Map<String, dynamic>> getCities() async {
    return appApi.getApiData(getCitiesApi);
  }

  Future<Map<String, dynamic>> getWarehouses() async {
    return appApi.getApiData(getWarehousesApi);
  } */
}
