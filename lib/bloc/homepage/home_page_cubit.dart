import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:template/domain/models/customers_model.dart';
import 'package:template/domain/models/sales_deliveries_model.dart';
import 'package:template/domain/models/orders_model.dart';
import 'package:template/domain/models/loading_orders_model.dart';
import 'package:template/domain/models/vehiclesModel.dart';
import 'package:path_provider/path_provider.dart';

import '../../constants/globals.dart';
import '../../constants/strings.dart';
import '../../domain/helpers/shared_prefs.dart';
import '../../domain/models/customer_model.dart';
import '../../domain/models/driver_model.dart';
import '../../domain/models/driver_trips_model.dart';
import '../../domain/models/factory_model.dart';
import '../../domain/models/financial_report_model.dart';
import '../../domain/models/main_report_model.dart';
import '../../domain/models/products_model.dart';
import '../../domain/models/purchase_orders_model.dart';
import '../../domain/models/sales_quotations_model.dart';
import '../../domain/models/transporter_model.dart';
import '../../domain/models/unit_price_for_customer_model.dart';
import '../../domain/repos/home_page_repo.dart';
import '../../presentation/screens/homepage/home_screen.dart';
import '../../presentation/shared/toasts.dart';

part 'home_page_states.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  final HomePageRepo homePageRepo;

  HomePageCubit(this.homePageRepo) : super(HomePageCubitInitial());
  static HomePageCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
  /* START REPORT */
  DateTimeRange? selectedDateRange;
  String? selectedFromItem;
  String? selectedToItem;

  FinancialReportModel? financialReportModel;
  List<Map<String, dynamic>> financialReportList = [];

  List<Map<String, dynamic>> searchFinancialReportList = [];
  TextEditingController financialReportSearchController =
      TextEditingController();
  /* END REPORT */

  CustomersModel? customersModel;
  CustomerModel? customerModel;

  MainReportModel? mainReportModel;
  ProductsModel? productsModel;
  VehiclesModel? vehiclesModel;
  VehiclesModel? dropDownVehiclesModel;
  OrdersModel? ordersModel;
  SalesDeliveriesModel? salesDeliveryModel;
  LoadingOrdersModel? loadingOrdersModel;
  FactoryModel? factoriesModel;
  DriverTripsModel? driverTripsModel;
  List<Map<String, dynamic>> customersList = [];
  List<Map<String, dynamic>> productsList = [];
  List<Map<String, dynamic>> vehiclesList = [];
  List<Map<String, dynamic>> ordersList = [];
  List<Map<String, dynamic>> salesDeliveryList = [];
  List<Map<String, dynamic>> loadingOrdersList = [];
  List<Map<String, dynamic>> driverTripsList = [];
  List<Map<String, dynamic>> factoriesList = [];
  final List<String> customersItems = [
    "Name".tr(),
    "Email".tr(),
    "Address".tr(),
    "City".tr(),
    "Country".tr(),
    "Location".tr(),
    "Sap Ref No.".tr(),
  ];
  final List<String> productsItems = [
    "Products Code".tr(),
    "Status".tr(),
    "English Name".tr(),
    "Arabic Name".tr(),
    "Category".tr(),
    "Warehouse".tr(),
  ];
  final List<String> vehiclesItems = [
    "Name".tr(),
    "Model".tr(),
    "Color".tr(),
    "Plat number".tr(),
    "Status".tr(),
  ];
  final List<String> ordersItems = [
    "Customer Name".tr(),
    "Customer Code".tr(),
    "Transaction Number".tr(),
    "Transaction date".tr(),
    "Status".tr(),
  ];
  final List<String> salesDeliveryItems = [
    "Customer Name".tr(),
    "Customer Code".tr(),
    "Transaction Number".tr(),
    "Transaction date".tr(),
    "Status".tr(),
  ];
  final List<String> loadingOrdersItems = [
    "Order Number".tr(),
    "Customer Name".tr(),
    "Customer Ref No".tr(),
    "Factory Name".tr(),
    "Transaction date".tr(),
    "Status".tr(),
  ];
  final List<String> driverTripsItems = [
    "Order Number".tr(),
    "Customer Name".tr(),
    "Customer Ref No".tr(),
    "Factory Name".tr(),
    "Transaction date".tr(),
    "Status".tr(),
  ];
  final List<String> factoryItems = [
    "Factory Code".tr(),
    "Factory Name".tr(),
    "Status".tr(),
  ];
  List<String> selectedItems = [];
  List<Map<String, dynamic>> searchCustomersList = [];
  List<Map<String, dynamic>> searchProductsList = [];
  List<Map<String, dynamic>> searchVehiclesList = [];
  List<Map<String, dynamic>> searchOrdersList = [];
  List<Map<String, dynamic>> searchSalesDeliveryList = [];
  List<Map<String, dynamic>> searchLoadingOrdersList = [];
  List<Map<String, dynamic>> searchDriverTripsList = [];
  List<Map<String, dynamic>> searchFactoriesList = [];
  TextEditingController productsSearchController = TextEditingController();
  TextEditingController customersSearchController = TextEditingController();
  TextEditingController vehiclesSearchController = TextEditingController();
  TextEditingController ordersSearchController = TextEditingController();
  TextEditingController salesDeliverySearchController = TextEditingController();
  TextEditingController loadingOrdersSearchController = TextEditingController();
  TextEditingController driverTripsSearchController = TextEditingController();
  TextEditingController factoriesSearchController = TextEditingController();

  DriverModel? driversModel;
  DriverModel? dropDownDriversModel;
  List<Map<String, dynamic>> driversList = [];
  final List<String> driversItems = [
    "Username".tr(),
    "First Name".tr(),
    "Last Name".tr(),
    "Licence number".tr(),
    "Phone".tr(),
    "Assigned truck".tr(),
    "Status".tr(),
  ];

  List<Map<String, dynamic>> searchDriversList = [];
  TextEditingController driversSearchController = TextEditingController();

  TransporterModel? transportersModel;
  TransporterModel? dropDownTransportersModel;
  List<Map<String, dynamic>> transportersList = [];
  final List<String> transportersItems = [
    "Transporter Code".tr(),
    "Name".tr(),
    "Status".tr(),
  ];

  List<Map<String, dynamic>> searchTransportersList = [];
  TextEditingController transportersSearchController = TextEditingController();

  SalesQuotationsModel? salesQuotationsModel;
  SalesQuotationsModel? dropDownSalesQuotationsModel;
  List<Map<String, dynamic>> salesQuotationsList = [];
  final List<String> salesQuotationsItems = [
    "Customer Name".tr(),
    "Customer Code".tr(),
    "Transaction Number".tr(),
    "Transaction date".tr(),
    "Status".tr(),
  ];

  List<Map<String, dynamic>> searchSalesQuotationsList = [];
  TextEditingController salesQuotationsSearchController =
      TextEditingController();

  PurchaseOrdersModel? purchaseOrdersModel;
  PurchaseOrdersModel? dropDownPurchaseOrdersModel;
  List<Map<String, dynamic>> purchaseOrdersList = [];
  final List<String> purchaseOrdersItems = [
    "Customer Name".tr(),
    "Customer Code".tr(),
    "Transaction Number".tr(),
    "Transaction date".tr(),
    "Status".tr(),
  ];

  UnitPriceForCustomerModel? unitPriceForCustomerModel;

  List<Map<String, dynamic>> searchPurchaseOrdersList = [];
  TextEditingController purchaseOrdersSearchController =
      TextEditingController();
  /* start add and edit pages */
  TextEditingController factoryNameController = TextEditingController();
  TextEditingController factoryCodeController = TextEditingController();
  TextEditingController driverFirstNameController = TextEditingController();
  TextEditingController driverLastNameController = TextEditingController();
  TextEditingController vehicleLicenceNumberController =
      TextEditingController();
  TextEditingController driverPhoneController = TextEditingController();
  TextEditingController transporterNameController = TextEditingController();
  TextEditingController transporterCodeController = TextEditingController();
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  TextEditingController vehicleManufactureController = TextEditingController();
  TextEditingController vehicleColorController = TextEditingController();
  TextEditingController vehicleIMEIController = TextEditingController();
  TextEditingController vehiclePlatNumberController = TextEditingController();
  bool factoryStatus = true;
  bool driverStatus = true;
  bool transporterStatus = true;
  bool vehicleStatus = true;
  bool isInternal = false;
  String? selectedNationality;
  String? assignedVechile;
  String? defaultDriver;
  String? vehicleTransporter;

  /* end add and edit pages */

  /* Start View Pages */
  //----------------------- SALES DELIVERY AND ORDER ------------------------//
  final TextEditingController salesDeliveryAndOrderTransactionNumberController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderCustomerCodeController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderCustomerNameController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderSelectFactoryController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderTransactionDateController =
      TextEditingController();
  final TextEditingController
      salesDeliveryAndOrderCustomerCurrentBalanceController =
      TextEditingController();
  final TextEditingController
      salesDeliveryAndOrderCustomerCreditLimitController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderStatusController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderSalesmanController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderVatPercentageController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderTotalBeforeVatController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderVatAmountController =
      TextEditingController();
  final TextEditingController salesDeliveryAndOrderTotalController =
      TextEditingController();

  List<SalesDeliveryLines>? salesDeliveryLines;
  List<SalesOrderLines>? salesOrdersLines;
  //----------------------- SALES DELIVERY AND ORDER ------------------------//
  //----------------------- SALES QUOTATITION ------------------------//
  final TextEditingController salesQuotationTransactionNumberController =
      TextEditingController();
  final TextEditingController salesQuotationCustomerCodeController =
      TextEditingController();
  final TextEditingController salesQuotationSelectedAddressesController =
      TextEditingController();
  final TextEditingController salesQuotationSelectFactoryController =
      TextEditingController();
  final TextEditingController salesQuotationNoteController =
      TextEditingController();
  final TextEditingController salesQuotationTransactionDateController =
      TextEditingController();

  final TextEditingController salesQuotationStatusController =
      TextEditingController();
  final TextEditingController salesQuotationSalesmanController =
      TextEditingController();
  final TextEditingController salesQuotationVatPercentageController =
      TextEditingController();
  final TextEditingController salesQuotationTotalBeforeVatController =
      TextEditingController();
  final TextEditingController salesQuotationVatAmountController =
      TextEditingController();
  final TextEditingController salesQuotationTotalController =
      TextEditingController();

  List<SalesQuotationLines>? salesQuotationLines;
  bool woodenBassesIncluded = false;
  bool unloadingIncluded = false;
  //----------------------- SALES QUOTATITION ------------------------//
  //----------------------- PURCHASE ORDERS ------------------------//
  final TextEditingController purchaseOrdersTransactionNumberController =
      TextEditingController();
  final TextEditingController purchaseOrdersCustomerCodeController =
      TextEditingController();
  final TextEditingController purchaseOrdersSelectedAddressesController =
      TextEditingController();
  final TextEditingController purchaseOrdersSelectFactoryController =
      TextEditingController();
  final TextEditingController purchaseOrdersNoteController =
      TextEditingController();
  final TextEditingController purchaseOrdersTransactionDateController =
      TextEditingController();

  final TextEditingController purchaseOrdersStatusController =
      TextEditingController();
  final TextEditingController purchaseOrdersSalesmanController =
      TextEditingController();
  final TextEditingController purchaseOrdersVatPercentageController =
      TextEditingController();
  final TextEditingController purchaseOrdersTotalBeforeVatController =
      TextEditingController();
  final TextEditingController purchaseOrdersVatAmountController =
      TextEditingController();
  final TextEditingController purchaseOrdersTotalController =
      TextEditingController();
  final TextEditingController purchaseOrdersProductCodeController =
      TextEditingController();
  final TextEditingController purchaseOrdersProductNameController =
      TextEditingController();
  final TextEditingController purchaseOrdersProductQuantityController =
      TextEditingController(text: "1");
  final TextEditingController purchaseOrdersProductUnitController =
      TextEditingController();
  final TextEditingController purchaseOrdersProductUnitPriceController =
      TextEditingController();
  final TextEditingController purchaseOrdersProductVatController =
      TextEditingController();
  final TextEditingController purchaseOrdersProductTotalBeforeVatController =
      TextEditingController();

  final TextEditingController purchaseOrdersProductVatAmountController =
      TextEditingController();
  final TextEditingController purchaseOrdersProductTotalPriceController =
      TextEditingController();
  final TextEditingController
      purchaseOrdersProductSalesQuotationNumberController =
      TextEditingController();
  String? selectedFactory;
  String? productCode;
  String? customerAddress;
  List<PurchaseOrderLines>? purchaseOrdersLines = [];
  /*  bool woodenBassesIncluded = false;
  bool unloadingIncluded = false; */
  //----------------------- PURCHASE ORDERS ------------------------//
  //----------------------- LOADING ORDERS ------------------------//
  final TextEditingController loadingOrdersFactoryController =
      TextEditingController();
  final TextEditingController loadingOrdersClientNameController =
      TextEditingController();
  final TextEditingController loadingOrdersLocationController =
      TextEditingController();
  final TextEditingController loadingOrdersProductController =
      TextEditingController();
  final TextEditingController loadingOrdersQuantityController =
      TextEditingController();
  final TextEditingController loadingOrdersCustomerReferenceNoController =
      TextEditingController();
  final TextEditingController loadingOrdersTransactionDateController =
      TextEditingController();
  final TextEditingController loadingOrdersNoOfRequestsController =
      TextEditingController();
  final TextEditingController loadingOrdersTransporterController =
      TextEditingController();
  final TextEditingController loadingOrdersTruckController =
      TextEditingController();
  final TextEditingController loadingOrdersDriverController =
      TextEditingController();

  //----------------------- LOADING ORDERS ------------------------//

  /* End View Pages */

  /* start dialogs */
  TextEditingController completeOrderImageController = TextEditingController();
  TextEditingController completeOrderQuantityController =
      TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;
  GlobalKey<FormState> completeOrderFormKey = GlobalKey<FormState>();
  pickImage(isCamera) async {
    image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    completeOrderImageController.text = image!.name;

    emit(PickImageState());
  }
  /* end dialogs */

  fillSelectedItems(String route) {
    if (route == customersRoute) {
      selectedItems = [
        "Name".tr(),
        "Email".tr(),
        "Address".tr(),
        "City".tr(),
        "Country".tr(),
        "Location".tr(),
        "Sap Ref No.".tr(),
      ];
    } else if (route == productsRoute) {
      selectedItems = [
        "Products Code".tr(),
        "Status".tr(),
        "English Name".tr(),
        "Arabic Name".tr(),
        "Category".tr(),
        "Warehouse".tr(),
      ];
    } else if (route == vehiclesRoute) {
      selectedItems = [
        "Name".tr(),
        "Model".tr(),
        "Color".tr(),
        "Plat number".tr(),
        "Status".tr(),
      ];
    } else if (route == ordersRoute) {
      selectedItems = [
        "Customer Name".tr(),
        "Customer Code".tr(),
        "Transaction Number".tr(),
        "Transaction date".tr(),
        "Status".tr(),
      ];
    } else if (route == salesDeliveryRoute) {
      selectedItems = [
        "Customer Name".tr(),
        "Customer Code".tr(),
        "Transaction Number".tr(),
        "Transaction date".tr(),
        "Status".tr(),
      ];
    } else if (route == salesQuotationRoute) {
      selectedItems = [
        "Customer Name".tr(),
        "Customer Code".tr(),
        "Transaction Number".tr(),
        "Transaction date".tr(),
        "Status".tr(),
      ];
    } else if (route == purchaseOrdersRoute) {
      selectedItems = [
        "Customer Name".tr(),
        "Customer Code".tr(),
        "Transaction Number".tr(),
        "Transaction date".tr(),
        "Status".tr(),
      ];
    } else if (route == loadingOrdersRoute) {
      selectedItems = [
        "Order Number".tr(),
        "Customer Name".tr(),
        "Customer Ref No".tr(),
        "Factory Name".tr(),
        "Transaction date".tr(),
        "Status".tr(),
      ];
    } else if (route == driverTripsRoute) {
      selectedItems = [
        "Order Number".tr(),
        "Customer Name".tr(),
        "Customer Ref No".tr(),
        "Factory Name".tr(),
        "Transaction date".tr(),
        "Status".tr(),
      ];
    } else if (route == factoriesRoute) {
      selectedItems = [
        "Factory Code".tr(),
        "Factory Name".tr(),
        "Status".tr(),
      ];
    } else if (route == driversRoute) {
      selectedItems = [
        "Username".tr(),
        "First Name".tr(),
        "Last Name".tr(),
        "Licence number".tr(),
        "Phone".tr(),
        "Assigned truck".tr(),
        "Status".tr(),
      ];
    } else if (route == transporterRoute) {
      selectedItems = [
        "Transporter Code".tr(),
        "Name".tr(),
        "Status".tr(),
      ];
    }
  }

  changeBottomNav(int index) {
    currentIndex = index;

    emit(HomePageBottomNavState());
  }

  changeVisibleItems(item) {
    final isSelected = selectedItems.contains(item);
    isSelected ? selectedItems.remove(item) : selectedItems.add(item);
    emit(ChangeVisibleItemState());
  }

  setNationality(String value) {
    selectedNationality = value;
    emit(SetDropdownState());
  }

  setAssignedVehicle(String value) {
    assignedVechile = value;
    emit(SetDropdownState());
  }

  setDefaultDriver(String value) {
    defaultDriver = value;
    emit(SetDropdownState());
  }

  setTransporter(String value) {
    vehicleTransporter = value;
    emit(SetDropdownState());
  }

  setFactory(String value) {
    selectedFactory = value;
    emit(SetDropdownState());
  }

  setCustomerAddress(String value) {
    customerAddress = value;
    getUnitPriceForCustomer(id: SharedPrefsHelpers.getint(key: "customerId"));

    emit(SetDropdownState());
  }

  setProductCode(String value) {
    productCode = value;
    log(productsModel!.data!.length.toString());
    purchaseOrdersProductNameController.text = productsModel!.data!
        .firstWhere((element) => element.id.toString() == value)
        .nameAr!;
    if (customerAddress != null) {
      getUnitPriceForCustomer(id: SharedPrefsHelpers.getint(key: "customerId"));
    }
    emit(SetDropdownState());
  }

  addPurchaseOrderLine() {
    if (productCode == null) {
      toast("Please select a product".tr());
      return;
    }
    if (customerAddress == null) {
      toast("Please select an address".tr());
      return;
    }
    if (purchaseOrdersProductQuantityController.text.isEmpty) {
      toast("Please enter quantity".tr());
      return;
    }
    if (purchaseOrdersProductUnitController.text.isEmpty) {
      toast("Please select unit".tr());
      return;
    }
    if (purchaseOrdersProductUnitPriceController.text.isEmpty) {
      toast("Please enter unit price".tr());
      return;
    }
    if (purchaseOrdersProductVatController.text.isEmpty) {
      toast("Please enter vat".tr());
      return;
    }
    if (purchaseOrdersProductTotalBeforeVatController.text.isEmpty) {
      toast("Please enter total before vat".tr());
      return;
    }
    if (purchaseOrdersProductVatAmountController.text.isEmpty) {
      toast("Please enter vat amount".tr());
      return;
    }
    if (purchaseOrdersProductTotalPriceController.text.isEmpty) {
      toast("Please enter total price".tr());
      return;
    }
    purchaseOrdersLines!.add(PurchaseOrderLines(
      itemId: int.parse(productCode!),
      itemCode: productsModel!.data!
          .firstWhere((element) => element.id.toString() == productCode)
          .code!,
      itemName: purchaseOrdersProductNameController.text,
      quantity: int.parse(purchaseOrdersProductQuantityController.text),
      uom: purchaseOrdersProductUnitController.text,
      unitPrice: double.parse(purchaseOrdersProductUnitPriceController.text),
      vatPercentage: double.parse(purchaseOrdersProductVatController.text),
      totalBeforeVat:
          double.parse(purchaseOrdersProductTotalBeforeVatController.text),
      vatAmount: double.parse(purchaseOrdersProductVatAmountController.text),
      total: double.parse(purchaseOrdersProductTotalPriceController.text),
      customerAddressId: int.parse(customerAddress!),
      parentSalesQuotationId:
          unitPriceForCustomerModel!.data!.salesQuotationId.toString(),
      parentSalesQuotationLineId:
          unitPriceForCustomerModel!.data!.salesQuotationLineId,
    ));
    /* update prices */
    num totalBeforeVat = purchaseOrdersLines!.fold(
        0, (previousValue, element) => element.unitPrice! + previousValue);
    num total = purchaseOrdersLines!
        .fold(0, (previousValue, element) => element.total! + previousValue);
    num vatAmount = purchaseOrdersLines!.fold(
        0, (previousValue, element) => element.vatAmount! + previousValue);

    purchaseOrdersVatPercentageController.text = "15";
    purchaseOrdersVatAmountController.text = vatAmount.toString();
    purchaseOrdersTotalBeforeVatController.text = totalBeforeVat.toString();
    purchaseOrdersTotalController.text = total.toString();
    /* Clear */
    purchaseOrdersProductCodeController.clear();
    purchaseOrdersProductNameController.clear();
    purchaseOrdersProductQuantityController.clear();
    purchaseOrdersProductUnitController.clear();
    purchaseOrdersProductUnitPriceController.clear();
    purchaseOrdersProductVatController.clear();
    purchaseOrdersProductTotalBeforeVatController.clear();
    purchaseOrdersProductVatAmountController.clear();
    purchaseOrdersProductTotalPriceController.clear();
    emit(AddPurchaseOrderLineState());
  }

  updateQuantity() {
    if (purchaseOrdersProductQuantityController.text == "") return;
    num vatAmount =
        (double.parse(purchaseOrdersProductQuantityController.text) *
            unitPriceForCustomerModel!.data!.unitPrice! *
            0.15);
    purchaseOrdersProductVatAmountController.text = (vatAmount).toString();

    purchaseOrdersProductTotalBeforeVatController.text =
        (int.parse(purchaseOrdersProductQuantityController.text) *
                unitPriceForCustomerModel!.data!.unitPrice!)
            .toString();
    purchaseOrdersProductTotalPriceController.text =
        (int.parse(purchaseOrdersProductQuantityController.text) *
                    unitPriceForCustomerModel!.data!.unitPrice! +
                vatAmount)
            .toString();
    emit(HomePageUpdateQuantityState());
  }

  updatePage() {
    print("update page");
    emit(HomePageUpdateState());
  }

  getUserById({id, currentUser = false}) async {
    emit(GetUserLoadingState());
    if (currentUser) {
      id = await SharedPrefsHelpers.getData(key: "userId");
    }
    homePageRepo.getUserById(id).then((value) {
      userModel = value;
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUserErrorState());
    });
  }

  getUnitPriceForCustomer({
    id,
  }) async {
    emit(GetUnitPriceForCustomerLoadingState());

    homePageRepo.getUnitPriceForCustomer({
      "customerId": id,
      "productId": productCode,
      "customerAddressId": customerAddress
    }).then((value) {
      unitPriceForCustomerModel = value;
      purchaseOrdersProductVatController.text = "15";
      purchaseOrdersProductUnitController.text = "Ton".tr();
      purchaseOrdersProductUnitPriceController.text =
          value.data!.unitPrice!.toString();
      purchaseOrdersProductTotalBeforeVatController.text =
          value.data!.unitPrice!.toString();

      purchaseOrdersProductVatAmountController.text =
          (value.data!.unitPrice! * 0.15).toString();
      purchaseOrdersProductTotalPriceController.text =
          (value.data!.unitPrice! + value.data!.unitPrice! * 0.15).toString();
      purchaseOrdersProductSalesQuotationNumberController.text =
          value.data!.salesQuotationId! == -1
              ? "No Sales Quotation Found".tr()
              : value.data!.salesQuotationNumber!;
      emit(GetUnitPriceForCustomerSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUnitPriceForCustomerErrorState());
    });
  }

  getAccountStatement(
    id,
  ) async {
    emit(GetAccountStatementLoadingState());
    homePageRepo.getAccountStatement({
      "customerId": id,
      "dateFrom": selectedDateRange!.start.toString(),
      "dateTo": selectedDateRange!.end.toString()
    }).then((value) {
      openPdfExternally(value.data!.pdfContent!);
      emit(GetAccountStatementSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetAccountStatementErrorState());
    });
  }

  getSalesItemsReport(
    id,
  ) async {
    emit(GetSalesItemsLoadingState());
    homePageRepo.getSalesItemsReport({
      "customerId": id,
      "dateFrom": selectedDateRange!.start.toString(),
      "dateTo": selectedDateRange!.end.toString(),
      "fromItem": selectedFromItem,
      "toItem": selectedToItem
    }).then((value) {
      openPdfExternally(value.data!.pdfContent!);
      emit(GetSalesItemsSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetSalesItemsErrorState());
    });
  }

  Future<void> openPdfExternally(String base64Pdf) async {
    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/report.pdf");

    List<int> bytes = base64Decode(base64Pdf);
    await file.writeAsBytes(bytes, flush: true);

    OpenFile.open(file.path);
  }

  void getFinancialReport(id) async {
    emit(GetFinancialReportLoadingState());

    homePageRepo.getFinancialReport({
      "customerId": id,
      "dateFrom": selectedDateRange!.start.toString(),
      "dateTo": selectedDateRange!.end.toString(),
    }).then((value) {
      financialReportModel = value;
      financialReportList = [];
      for (var element in value.data!.transactions!) {
        financialReportList.add({
          "Transaction Date": element.transactionDate,
          "Transaction Details": element.transactionDetails ?? "",
          // "Currency": element.currency ?? "",
          "Debit": element.debit ?? "",
          "Credit": element.credit ?? "",
          "Balance": element.balance,
        });
      }
      emit(GetFinancialReportSuccessState());
    }) /* .catchError((error) {
      print(error);
      emit(GetFinancialReportErrorState());
    }) */
        ;
  }

  void getCustomers() async {
    fillSelectedItems(customersRoute);
    emit(GetCustomersLoadingState());

    homePageRepo.getCustomers().then((value) {
      customersModel = value;
      customersList = [];
      for (var element in value.data!) {
        customersList.add({
          "Name": element.name ?? "",
          "Id": element.id,
          "Email": element.emailAddress ?? "",
          "Address": element.customerAddresses!.isEmpty
              ? ""
              : element.customerAddresses!
                  .map((e) => e.address ?? "")
                  .join(", "),
          "City": element.city ?? "",
          "Country": element.country ?? "",
          "Location": element.googleLocation ?? "",
          "Sap Ref No.": element.code ?? "",
        });
      }
      emit(GetCustomersSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetCustomersErrorState());
    });
  }

  searchCustomers() {
    searchCustomersList = [];
    for (Map<String, dynamic> element in customersList) {
      if (element["Name"]
          .toString()
          .toLowerCase()
          .contains(customersSearchController.text.toLowerCase())) {
        searchCustomersList.add(element);
      }
    }
    emit(SearchCustomersState());
  }

  void getCustomer(id) async {
    emit(GetCustomersLoadingState());

    homePageRepo.getCustomer(id).then((value) {
      customerModel = value;

      /* for (var element in value.data!) {
        customersList.add({
          "Name": element.name ?? "",
          "Id": element.id,
          "Email": element.emailAddress ?? "",
          "Address": element.customerAddresses!.isEmpty
              ? ""
              : element.customerAddresses!
                  .map((e) => e.address ?? "")
                  .join(", "),
          "City": element.city ?? "",
          "Country": element.country ?? "",
          "Location": element.googleLocation ?? "",
          "Sap Ref No.": element.code ?? "",
        });
      } */
      emit(GetCustomersSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetCustomersErrorState());
    });
  }

  void getProducts({fill = true}) async {
    if (fill) {
      fillSelectedItems(productsRoute);
    }
    emit(GetProductsLoadingState());

    homePageRepo.getProducts().then((value) {
      productsModel = value;
      productsList = [];
      for (var element in value.data!) {
        productsList.add({
          "Id": element.id,
          "Products Code": element.code ?? "",
          "Status": element.status! ? "Active".tr() : "Deactivated".tr(),
          "English Name": element.name ?? "",
          "Arabic Name": element.nameAr ?? "",
          "Category": "",
          "Warehouse": "",
          "Image": element.imagePath,
        });
      }
      emit(GetProductsSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetProductsErrorState());
    });
  }

  searchProducts() {
    searchProductsList = [];
    for (Map<String, dynamic> element in productsList) {
      if (element["English Name"]
          .toString()
          .toLowerCase()
          .contains(productsSearchController.text.toLowerCase())) {
        searchProductsList.add(element);
      }
    }
    emit(SearchProductsState());
  }

  void getVehicles() async {
    fillSelectedItems(vehiclesRoute);
    emit(GetVehiclesLoadingState());

    homePageRepo.getVehicles().then((value) {
      vehiclesModel = value;
      vehiclesList = [];
      for (var element in value.data!) {
        vehiclesList.add({
          "Id": element.id,
          "Name": element.name ?? "",
          "Model": element.model ?? "",
          "Color": element.color ?? "",
          "Plat number": element.platNumber ?? "",
          "Manufacture": element.manufacturer ?? "",
          "Licence Number": element.licenseNumber ?? "",
          "IMEI": element.imei ?? "",
          "Status": element.isActive! ? "Active".tr() : "Deactivated".tr(),
        });
      }
      emit(GetVehiclesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetVehiclesErrorState());
    });
  }

  searchVehicles() {
    searchVehiclesList = [];
    for (Map<String, dynamic> element in vehiclesList) {
      if (element["Name"]
          .toString()
          .toLowerCase()
          .contains(vehiclesSearchController.text.toLowerCase())) {
        searchVehiclesList.add(element);
      }
    }
    emit(SearchVehiclesState());
  }

  String getOrderStatus(status) {
    if (status == 0) {
      return "Draft".tr();
    } else if (status == 1) {
      return "In Progress".tr();
    } else if (status == 2) {
      return "Completed".tr();
    } else if (status == 3) {
      return "Synced".tr();
    }
    return "";
  }

  String getSalesDeliveryStatus(status) {
    if (status == 0) {
      return "Draft".tr();
    } else if (status == 1) {
      return "Completed".tr();
    } else if (status == 2) {
      return "Synced".tr();
    }
    return "";
  }

  String getDriverTripsStatus(status) {
    if (status == 0) {
      return "Draft".tr();
    } else if (status == 1) {
      return "In Progress".tr();
    } else if (status == 2) {
      return "Completed".tr();
    } else if (status == 3) {
      return "Synced".tr();
    }
    return "";
  }

  void getOrders() async {
    fillSelectedItems(ordersRoute);
    emit(GetOrdersLoadingState());

    homePageRepo.getOrders().then((value) {
      ordersModel = value;
      ordersList = [];
      for (var element in value.data!) {
        ordersList.add({
          "Id": element.id,
          "Customer Name": element.customerName ?? "",
          "Customer Code": element.customerCode ?? "",
          "Transaction Number": element.transactionNumber ?? "",
          "Transaction date": element.transactionDate ?? "",
          "Status": getOrderStatus(element.status!),
        });
      }
      emit(GetOrdersSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetOrdersErrorState());
    });
  }

  searchOrders() {
    searchOrdersList = [];
    for (Map<String, dynamic> element in ordersList) {
      if (element["Transaction Number"]
          .toString()
          .toLowerCase()
          .contains(ordersSearchController.text.toLowerCase())) {
        searchOrdersList.add(element);
      }
    }
    emit(SearchOrdersState());
  }

  void getSalesDelivery() async {
    fillSelectedItems(salesDeliveryRoute);
    emit(GetSalesDeliveryLoadingState());

    homePageRepo.getSalesDelivery().then((value) {
      salesDeliveryModel = value;
      salesDeliveryList = [];
      for (var element in value.data!) {
        salesDeliveryList.add({
          "Id": element.id,
          "Customer Name": element.customerName ?? "",
          "Customer Code": element.customerCode ?? "",
          "Transaction Number": element.transactionNumber ?? "",
          "Transaction date": element.transactionDate ?? "",
          "Status": getSalesDeliveryStatus(element.status!),
        });
      }
      emit(GetSalesDeliverySuccessState());
    }).catchError((error) {
      print(error);
      emit(GetSalesDeliveryErrorState());
    });
  }

  searchSalesDelivery() {
    searchSalesDeliveryList = [];
    for (Map<String, dynamic> element in salesDeliveryList) {
      if (element["Transaction Number"]
          .toString()
          .toLowerCase()
          .contains(salesDeliverySearchController.text.toLowerCase())) {
        searchSalesDeliveryList.add(element);
      }
    }
    emit(SearchSalesDeliveryState());
  }

  void getLoadingOrders() async {
    fillSelectedItems(loadingOrdersRoute);
    emit(GetLoadingOrdersLoadingState());

    homePageRepo.getLoadingOrders().then((value) {
      loadingOrdersModel = value;
      loadingOrdersList = [];
      for (var element in value.data!) {
        loadingOrdersList.add({
          "Id": element.id,
          "Order Number": element.orderNumber ?? "",
          "Customer Name": element.customerName ?? "",
          "Customer Ref No": element.customerRefNo ?? "",
          "Factory Name": element.factoryName ?? "",
          "Transaction date": element.transactionDate!.substring(0, 10),
          "Status": getOrderStatus(element.status!),
        });
      }
      emit(GetLoadingOrdersSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetLoadingOrdersErrorState());
    });
  }

  searchLoadingOrders() {
    searchLoadingOrdersList = [];
    for (Map<String, dynamic> element in loadingOrdersList) {
      if (element["Order Number"]
          .toString()
          .toLowerCase()
          .contains(loadingOrdersSearchController.text.toLowerCase())) {
        searchLoadingOrdersList.add(element);
      }
    }
    emit(SearchLoadingOrdersState());
  }

  void getFactories({fill = true}) async {
    if (fill) {
      fillSelectedItems(factoriesRoute);
    }
    emit(GetFactoriesLoadingState());

    homePageRepo.getFactories().then((value) {
      factoriesModel = value;
      factoriesList = [];
      for (var element in value.data!) {
        factoriesList.add({
          "Id": element.id,
          "Factory Code": element.code ?? "",
          "Factory Name": element.name ?? "",
          "Status": element.isActive! ? "Active".tr() : "Deactivated".tr(),
        });
      }
      emit(GetFactoriesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetFactoriesErrorState());
    });
  }

  searchFactories() {
    searchFactoriesList = [];
    for (Map<String, dynamic> element in factoriesList) {
      if (element["Factory Code"]
              .toString()
              .toLowerCase()
              .contains(factoriesSearchController.text.toLowerCase()) ||
          element["Factory Name"]
              .toString()
              .toLowerCase()
              .contains(factoriesSearchController.text.toLowerCase())) {
        searchFactoriesList.add(element);
      }
    }
    emit(SearchFactoriesState());
  }

  void getDrivers() async {
    fillSelectedItems(driversRoute);
    emit(GetDriversLoadingState());

    homePageRepo.getDrivers().then((value) {
      driversModel = value;
      driversList = [];
      for (var element in value.data!) {
        driversList.add({
          "Id": element.id,
          "Username": element.userName ?? "",
          "First Name": element.firstName ?? "",
          "Last Name": element.lastName ?? "",
          "Licence number": element.licenseNumber ?? "",
          "Phone": element.contactNumber ?? "",
          "Assigned truck": element.assignedVehicleName ?? "",
          "Status": element.isActive! ? "Active".tr() : "Deactivated".tr(),
          "Image": element.photoUrl ?? "",
          "Nationality": element.nationality ?? "",
        });
      }
      emit(GetDriversSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetDriversErrorState());
    });
  }

  searchDrivers() {
    searchDriversList = [];
    for (Map<String, dynamic> element in driversList) {
      if (element["Driver Code"]
              .toString()
              .toLowerCase()
              .contains(driversSearchController.text.toLowerCase()) ||
          element["Driver Name"]
              .toString()
              .toLowerCase()
              .contains(driversSearchController.text.toLowerCase())) {
        searchDriversList.add(element);
      }
    }
    emit(SearchDriversState());
  }

  void getTransporters() async {
    fillSelectedItems(transporterRoute);
    emit(GetTransporterLoadingState());

    homePageRepo.getTransporters().then((value) {
      transportersModel = value;
      transportersList = [];
      for (var element in value.data!) {
        transportersList.add({
          "Id": element.id,
          "Transporter Code": element.code ?? "",
          "Name": element.name ?? "",
          "Status": element.isActive! ? "Active".tr() : "Deactivated".tr(),
        });
      }
      emit(GetTransporterSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetTransporterErrorState());
    });
  }

  searchTransporters() {
    searchTransportersList = [];
    for (Map<String, dynamic> element in transportersList) {
      if (element["Transporter Code"]
              .toString()
              .toLowerCase()
              .contains(transportersSearchController.text.toLowerCase()) ||
          element["Name"]
              .toString()
              .toLowerCase()
              .contains(transportersSearchController.text.toLowerCase())) {
        searchTransportersList.add(element);
      }
    }
    emit(SearchTransporterState());
  }

  deleteVehicle(id) {
    emit(DeleteVehicleLoadingState());
    homePageRepo.deleteVehicle(id).then((value) {
      if (value.statusCode == 200) {
        getVehicles();
        emit(DeleteVehicleSuccessState());
        toast(value.data!, color: Colors.green);
      } else {
        emit(DeleteVehicleErrorState());
        toast(value.data!, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(DeleteVehicleErrorState());
    });
  }

  deleteDriver(id) {
    emit(DeleteDriverLoadingState());
    homePageRepo.deleteDriver(id).then((value) {
      if (value.statusCode == 200) {
        getDrivers();
        emit(DeleteDriverSuccessState());
        toast(value.data!, color: Colors.green);
      } else {
        emit(DeleteDriverErrorState());
        toast(value.data!, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(DeleteDriverErrorState());
    });
  }

  deleteFactory(id) {
    emit(DeleteFactoryLoadingState());
    homePageRepo.deleteFactory(id).then((value) {
      if (value.statusCode == 200) {
        getFactories();
        emit(DeleteFactorySuccessState());
        toast(value.data!, color: Colors.green);
      } else {
        emit(DeleteFactoryErrorState());
        toast(value.data!, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(DeleteFactoryErrorState());
    });
  }

  addFactory() {
    if (factoryCodeController.text.isEmpty ||
        factoryNameController.text.isEmpty) {
      toast("Please fill all fields".tr(), color: Colors.red);
      return;
    }

    Map<String, dynamic> data = {
      "code": factoryCodeController.text.trim(),
      "name": factoryNameController.text.trim(),
      "isActive": factoryStatus,
    };

    print("data $data ");
    emit(AddFactoryLoadingState());
    homePageRepo.addFactory(data).then((value) {
      print("value $value ");
      if (value.statusCode == 200) {
        emit(AddFactorySuccessState());
        toast("Added Successfully".tr(), color: Colors.green);
      } else {
        emit(AddFactoryErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(AddFactoryErrorState());
    });
  }

  initFactoryScreen(args) {
    factoryCodeController.clear();
    factoryNameController.clear();
    if (args["isEdit"]) {
      Map role = factoriesList
          .firstWhere((element) => element["Id"] == args["factoryId"]);
      factoryCodeController.text = role["Factory Code"];
      factoryNameController.text = role["Factory Name"];
    }
  }

  addDriver() {
    Map<String, dynamic> data = {
      "FirstName": driverFirstNameController.text.trim(),
      "LastName": driverLastNameController.text.trim(),
      "LicenseNumber": vehicleLicenceNumberController.text.trim(),
      "ContactNumber": driverPhoneController.text.trim(),
      "AssignedVehicleId": int.tryParse(assignedVechile!),
      "Nationality": selectedNationality,
      "isActive": factoryStatus,
    };

    print("data $data ");
    emit(AddDriverLoadingState());
    homePageRepo.addDriver(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(AddDriverSuccessState());
        toast("Added Successfully".tr(), color: Colors.green);
      } else {
        emit(AddDriverErrorState());
        toast("Error while adding".tr(), color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(AddDriverErrorState());
    });
  }

  addTransporter() {
    Map<String, dynamic> data = {
      "name": transporterNameController.text.trim(),
      "code": transporterCodeController.text.trim(),
      "isActive": transporterStatus,
    };

    print("data $data ");
    emit(AddTransporterLoadingState());
    homePageRepo.addTransporter(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(AddTransporterSuccessState());
        toast("Added Successfully".tr(), color: Colors.green);
      } else {
        emit(AddTransporterErrorState());
        toast("Error while adding".tr(), color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(AddTransporterErrorState());
    });
  }

  addVehicle() {
    Map<String, dynamic> data = {
      "Name": vehicleNameController.text.trim(),
      "PlatNumber": vehiclePlatNumberController.text.trim(),
      "Imei": vehicleIMEIController.text.trim(),
      "Model": vehicleModelController.text.trim(),
      "Manufacturer": vehicleManufactureController.text.trim(),
      "Color": vehicleColorController.text.trim(),
      "DefaultDriverId": int.tryParse(defaultDriver!),
      "LicenseNumber": vehicleLicenceNumberController.text.trim(),
      "IsInternal": isInternal,
      "TransporterId": int.tryParse(vehicleTransporter!),
      "isActive": vehicleStatus,
    };

    print("data $data ");
    emit(AddVehicleLoadingState());
    homePageRepo.addVehicle(data).then((value) {
      print("value $value ");
      if (value.statusCode == 200) {
        emit(AddVehicleSuccessState());
        toast("Added Successfully".tr(), color: Colors.green);
      } else {
        emit(AddVehicleErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(AddVehicleErrorState());
    });
  }

  initVehicleScreen(args) {
    vehicleLicenceNumberController.clear();
    vehicleNameController.clear();
    vehicleModelController.clear();
    vehicleManufactureController.clear();
    vehicleColorController.clear();
    vehicleIMEIController.clear();
    vehiclePlatNumberController.clear();
    if (args["isEdit"]) {
      Map role = vehiclesList
          .firstWhere((element) => element["Id"] == args["vehicleId"]);
      vehicleLicenceNumberController.text = role["Licence Number"];
      vehicleNameController.text = role["Name"];
      vehicleModelController.text = role["Model"];
      vehicleManufactureController.text = role["Manufacture"];
      vehicleColorController.text = role["Color"];
      vehicleIMEIController.text = role["IMEI"];
      vehiclePlatNumberController.text = role["Plat number"];
    }
  }

  initDriverScreen(args) {
    driverFirstNameController.clear();
    driverLastNameController.clear();
    vehicleLicenceNumberController.clear();
    driverPhoneController.clear();
    selectedNationality = null;
    assignedVechile = null;
    print("driversList $driversList ");

    if (args["isEdit"]) {
      Map driver = driversList
          .firstWhere((element) => element["Id"] == args["driverId"]);
      driverFirstNameController.text = driver["First Name"];
      driverLastNameController.text = driver["Last Name"];
      vehicleLicenceNumberController.text = driver["Licence number"];
      driverPhoneController.text = driver["Phone"];
      driverStatus = driver["Status"] == "Active";
      selectedNationality = driver["Nationality"];
      assignedVechile = dropDownVehiclesModel?.data!
          .firstWhere((element) => element.name == driver["Assigned truck"])
          .id
          .toString();
    }
  }

  initTransporterScreen(args) {
    transporterCodeController.clear();
    transporterNameController.clear();

    if (args["isEdit"]) {
      Map driver = transportersList
          .firstWhere((element) => element["Id"] == args["transporterId"]);
      transporterCodeController.text = driver["Transporter Code"];
      transporterNameController.text = driver["Name"];
    }
  }

  changeFactoryStatus() {
    factoryStatus = !factoryStatus;
    emit(ChangeCheckBoxStatusState());
  }

  changeVehicleStatus() {
    vehicleStatus = !vehicleStatus;
    emit(ChangeCheckBoxStatusState());
  }

  changeIsInternal() {
    isInternal = !isInternal;
    emit(ChangeCheckBoxStatusState());
  }

  changeDriverStatus() {
    driverStatus = !driverStatus;
    emit(ChangeCheckBoxStatusState());
  }

  changeTransporterStatus() {
    transporterStatus = !transporterStatus;
    emit(ChangeCheckBoxStatusState());
  }

  editFactory(id) {
    if (factoryCodeController.text.isEmpty ||
        factoryNameController.text.isEmpty) {
      toast("Please fill all fields".tr(), color: Colors.red);
      return;
    }

    Map<String, dynamic> data = {
      "code": factoryCodeController.text.trim(),
      "name": factoryNameController.text.trim(),
      "isActive": factoryStatus,
      "id": id
    };

    print("data $data ");
    emit(EditFactoryLoadingState());
    homePageRepo.editFactory(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(EditFactorySuccessState());
        toast("Edited Successfully".tr(), color: Colors.green);
      } else {
        emit(EditFactoryErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(EditFactoryErrorState());
    });
  }

  editVehicle(id) {
    Map<String, dynamic> data = {
      "Name": vehicleNameController.text.trim(),
      "PlatNumber": vehiclePlatNumberController.text.trim(),
      "Imei": vehicleIMEIController.text.trim(),
      "Model": vehicleModelController.text.trim(),
      "Manufacturer": vehicleManufactureController.text.trim(),
      "Color": vehicleColorController.text.trim(),
      "DefaultDriverId": int.tryParse(defaultDriver!),
      "LicenseNumber": vehicleLicenceNumberController.text.trim(),
      "IsInternal": isInternal,
      "TransporterId": int.tryParse(vehicleTransporter!),
      "isActive": vehicleStatus,
      "id": id
    };

    print("data $data ");
    emit(EditVehicleLoadingState());
    homePageRepo.editVehicle(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(EditVehicleSuccessState());
        toast("Edited Successfully".tr(), color: Colors.green);
      } else {
        emit(EditVehicleErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(EditVehicleErrorState());
    });
  }

  editTransporter(id) {
    Map<String, dynamic> data = {
      "name": transporterNameController.text.trim(),
      "code": transporterCodeController.text.trim(),
      "isActive": transporterStatus,
      "id": id
    };

    print("data $data ");
    emit(EditTransporterLoadingState());
    homePageRepo.editTransporter(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(EditTransporterSuccessState());
        toast("Edited Successfully".tr(), color: Colors.green);
      } else {
        emit(EditTransporterErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(EditTransporterErrorState());
    });
  }

  editDriver(id) {
    Map<String, dynamic> data = {
      "FirstName": driverFirstNameController.text.trim(),
      "LastName": driverLastNameController.text.trim(),
      "LicenseNumber": vehicleLicenceNumberController.text.trim(),
      "ContactNumber": driverPhoneController.text.trim(),
      "AssignedVehicleId": int.tryParse(assignedVechile!),
      "Nationality": selectedNationality,
      "isActive": factoryStatus,
      "id": id
    };

    emit(EditDriverLoadingState());
    homePageRepo.editDriver(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(EditDriverSuccessState());
        toast("Edited Successfully".tr(), color: Colors.green);
      } else {
        emit(EditDriverErrorState());
        toast("Error while editing".tr(), color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(EditDriverErrorState());
    });
  }

  deleteTransporter(id) {
    emit(DeleteTransporterLoadingState());
    homePageRepo.deleteTransporter(id).then((value) {
      if (value.statusCode == 200) {
        getFactories();
        emit(DeleteTransporterSuccessState());
        toast(value.data!, color: Colors.green);
      } else {
        emit(DeleteTransporterErrorState());
        toast(value.data!, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(DeleteTransporterErrorState());
    });
  }

  void getDropDownVehicles() async {
    emit(GetVehiclesLoadingState());

    homePageRepo.getVehicles().then((value) {
      dropDownVehiclesModel = value;

      emit(GetVehiclesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetVehiclesErrorState());
    });
  }

  void getDropDownTransporters() async {
    emit(GetTransporterLoadingState());

    homePageRepo.getTransporters().then((value) {
      dropDownTransportersModel = value;

      emit(GetTransporterSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetTransporterErrorState());
    });
  }

  void getDropDownDrivers() async {
    emit(GetDriversLoadingState());

    homePageRepo.getDrivers().then((value) {
      dropDownDriversModel = value;

      emit(GetDriversSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetDriversErrorState());
    });
  }

  void getMainReport() async {
    emit(GetMainReportLoadingState());

    homePageRepo.getMainReport().then((value) {
      mainReportModel = value;
      print("mainReportModel $mainReportModel ");

      emit(GetMainReportSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetMainReportErrorState());
    });
  }
  /* Driver */

  void getDriverTrips() async {
    fillSelectedItems(driverTripsRoute);
    emit(GetDriverTripsLoadingState());

    homePageRepo.getDriverTrips().then((value) {
      driverTripsModel = value;
      driverTripsList = [];
      for (var element in value.data!.items!) {
        driverTripsList.add({
          "Id": element.id,
          "Order Number": element.orderNumber ?? "",
          "Customer Name": element.customerName ?? "",
          "Customer Ref No": element.customerRefNo ?? "",
          "Factory Name": element.factoryName ?? "",
          "Transaction date": element.transactionDate ?? "",
          "Quantity": element.quantity,
          "Status": getDriverTripsStatus(element.status!),
        });
      }
      emit(GetDriverTripsSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetDriverTripsErrorState());
    });
  }

  searchDriverTrips() {
    searchDriverTripsList = [];
    for (Map<String, dynamic> element in driverTripsList) {
      if (element["Order Number"]
          .toString()
          .toLowerCase()
          .contains(loadingOrdersSearchController.text.toLowerCase())) {
        searchDriverTripsList.add(element);
      }
    }
    emit(SearchDriverTripsState());
  }

  completeLoadingOrder(id) async {
    var sendedImage = await MultipartFile.fromFile(
      image!.path,
      filename: image!.name,
    );
    Map<String, dynamic> data = {
      "actualDeliveredQuantity": completeOrderQuantityController.text,
      "deliveryAuthAttachmentFileName": image!.name,
      "deliveryAuthAttachmentFileContent": sendedImage,
      "id": id
    };

    emit(CompleteLoadingOrderLoadingState());

    homePageRepo.completeLoadingOrder(data).then((value) {
      if (value.statusCode == 200) {
        emit(CompleteLoadingOrderSuccessState());
        toast("Order Completed".tr(), color: Colors.green);
        getDriverTrips();
      } else {
        emit(CompleteLoadingOrderErrorState());
        toast("Error while sending".tr(), color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(CompleteLoadingOrderErrorState());
    });
  }

  String getSalesOrderStatus(status) {
    if (status == 0) {
      return "Draft".tr();
    } else if (status == 1) {
      return "Waiting for salesman approval".tr();
    } else if (status == 2) {
      return "Ready".tr();
    } else if (status == 3) {
      return "Accepted".tr();
    } else if (status == 4) {
      return "Rejected".tr();
    } else if (status == 5) {
      return "Cancelled".tr();
    }
    return "";
  }

  String getPurchaseOrderStatus(status) {
    if (status == 0) {
      return "Draft".tr();
    } else if (status == 1) {
      return "Waiting for salesman approval".tr();
    } else if (status == 5) {
      return "Placed".tr();
    } else if (status == 6) {
      return "Partially Posted".tr();
    } else if (status == 2) {
      return "Posted".tr();
    } else if (status == 3) {
      return "Synced".tr();
    } else if (status == 4) {
      return "Rejected By Sales Agent".tr();
    }
    return "";
  }

  void getSalesQuotations() async {
    fillSelectedItems(salesQuotationRoute);
    emit(GetSalesQuotationLoadingState());

    homePageRepo.getSalesQuotations().then((value) {
      salesQuotationsModel = value;
      salesQuotationsList = [];
      for (var element in value.data!) {
        salesQuotationsList.add({
          "Id": element.id,
          "Customer Name": element.customerName ?? "",
          "Customer Code": element.customerCode ?? "",
          "Transaction Number": element.transactionNumber ?? "",
          "Transaction date": element.transactionDate!.substring(0, 10),
          "Status": getSalesOrderStatus(element.status!),
        });
      }
      salesQuotationsList = salesQuotationsList.reversed.toList();
      emit(GetSalesQuotationSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetSalesQuotationErrorState());
    });
  }

  searchSalesQuotations() {
    searchSalesQuotationsList = [];
    for (Map<String, dynamic> element in salesQuotationsList) {
      if (element["Transaction Number"]
          .toString()
          .toLowerCase()
          .contains(salesQuotationsSearchController.text.toLowerCase())) {
        searchSalesQuotationsList.add(element);
      }
    }
    searchSalesQuotationsList = searchSalesQuotationsList.reversed.toList();

    emit(SearchSalesQuotationState());
  }

  void getPurchaseOrders() async {
    fillSelectedItems(salesQuotationRoute);
    emit(GetPurchaseOrdersLoadingState());

    homePageRepo.getPurchaseOrders().then((value) {
      purchaseOrdersModel = value;
      purchaseOrdersList = [];
      for (var element in value.data!) {
        purchaseOrdersList.add({
          "Id": element.id,
          "Customer Name": element.customerName ?? "",
          "Customer Code": element.customerCode ?? "",
          "Transaction Number": element.transactionNumber ?? "",
          "Transaction date": element.transactionDate!.substring(0, 10),
          "Status": getPurchaseOrderStatus(element.status!),
        });
      }
      purchaseOrdersList = purchaseOrdersList.reversed.toList();
      emit(GetPurchaseOrdersSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetPurchaseOrdersErrorState());
    });
  }

  searchPurchaseOrders() {
    searchPurchaseOrdersList = [];
    for (Map<String, dynamic> element in purchaseOrdersList) {
      if (element["Transaction Number"]
          .toString()
          .toLowerCase()
          .contains(purchaseOrdersSearchController.text.toLowerCase())) {
        searchPurchaseOrdersList.add(element);
      }
    }
    searchPurchaseOrdersList = searchPurchaseOrdersList.reversed.toList();

    emit(SearchPurchaseOrdersState());
  }

  acceptSalesQuotation(
    id,
  ) {
    Map<String, dynamic> data = {"id": id};

    print("data $data ");
    emit(EditSalesQuotationLoadingState());
    homePageRepo.acceptSalesQuotation(data).then((value) {
      if (value["statusCode"] == 200) {
        emit(EditSalesQuotationSuccessState());
        getSalesQuotations();
        toast("Accepted Successfully".tr(), color: Colors.green);
      } else {
        emit(EditSalesQuotationErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(EditSalesQuotationErrorState());
    });
  }

  rejectSalesQuotation(
    id,
  ) {
    Map<String, dynamic> data = {"id": id};

    print("data $data ");
    emit(EditSalesQuotationLoadingState());
    homePageRepo.rejectSalesQuotation(data).then((value) {
      if (value["statusCode"] == 200) {
        emit(EditSalesQuotationSuccessState());
        getSalesQuotations();
        toast("Rejected Successfully".tr(), color: Colors.green);
      } else {
        emit(EditSalesQuotationErrorState());
        toast(value.data, color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(EditSalesQuotationErrorState());
    });
  }

  addPurchaseOrder() async {
    if (selectedFactory == null || purchaseOrdersLines!.isEmpty) {
      toast("Please fill all fields".tr(), color: Colors.red);
      return;
    }

    List<Map<String, dynamic>> orderLines = [];

    for (int index = 0; index < purchaseOrdersLines!.length; index++) {
      var element = purchaseOrdersLines![index];

      orderLines.add(
        {
          "purchaseOrderLines[$index].id": 0,
          "purchaseOrderLines[$index].ItemId": element.itemId,
          "purchaseOrderLines[$index].Quantity": element.quantity,
          "purchaseOrderLines[$index].Total": element.total,
          "purchaseOrderLines[$index].TotalBeforeVAT": element.totalBeforeVat,
          "purchaseOrderLines[$index].UnitPrice": element.unitPrice,
          "purchaseOrderLines[$index].UOM": element.uom,
          "purchaseOrderLines[$index].VATAmount": element.vatAmount,
          "purchaseOrderLines[$index].VATPercentage": element.vatPercentage,
          "purchaseOrderLines[$index].customerAddressId":
              element.customerAddressId,
          "purchaseOrderLines[$index].parentSalesQuotationId":
              element.parentSalesQuotationId,
          "purchaseOrderLines[$index].ParentSalesQuotationLineId":
              element.parentSalesQuotationLineId,
        },
      );
    }

    Map<String, dynamic> data = {
      "id": 0,
      "customerId": await SharedPrefsHelpers.getData(key: "customerId"),
      "factoryId": selectedFactory,
      "salesManId":
          "375583a6-4616-44c9-a5a1-93f9929e8573", //TODO get the correct sales man id
      "status": 1,
      "transactionDate": purchaseOrdersTransactionDateController.text,
      "total": purchaseOrdersTotalController.text,
      "totalBeforeVAT": purchaseOrdersTotalBeforeVatController.text,
      "vatAmount": purchaseOrdersVatAmountController.text,
      "vatPercentage": purchaseOrdersVatPercentageController.text,
      "notes": "",
    };
    for (var element in orderLines) {
      data.addAll(element);
    }

    print("data $data ");
    emit(AddPurchaseOrderLoadingState());
    homePageRepo.addPurchaseOrder(data).then((value) {
      print("value $value ");
      if (value["statusCode"] == 200) {
        emit(AddPurchaseOrderSuccessState());
        toast("Purchase Order Created".tr(), color: Colors.green);
      } else {
        emit(AddPurchaseOrderErrorState());
        toast("Error".tr(), color: Colors.red);
      }
    }).catchError((error) {
      print(error);
      emit(AddPurchaseOrderErrorState());
    });
  }

  /* START VIEW SCREENS INIT */
  initSalesDeliveryScreen(id) {
    var data =
        salesDeliveryModel!.data!.firstWhere((element) => element.id == id);
    salesDeliveryAndOrderTransactionNumberController.text =
        data.transactionNumber.toString();
    salesDeliveryAndOrderCustomerCodeController.text =
        data.customerCode.toString();
    salesDeliveryAndOrderCustomerNameController.text =
        data.customerName.toString();
    salesDeliveryAndOrderSelectFactoryController.text =
        data.factoryName.toString();
    salesDeliveryAndOrderTransactionDateController.text =
        outputFormat.format(DateTime.parse(data.transactionDate!));
    salesDeliveryAndOrderCustomerCurrentBalanceController.text =
        data.customerCurrentBalance.toString();
    salesDeliveryAndOrderCustomerCreditLimitController.text =
        data.customerCreditLimit.toString();
    salesDeliveryAndOrderStatusController.text = getOrderStatus(data.status);
    salesDeliveryAndOrderSalesmanController.text = data.salesManName.toString();
    salesDeliveryAndOrderVatPercentageController.text =
        data.vatPercentage.toString();
    salesDeliveryAndOrderTotalBeforeVatController.text =
        data.totalBeforeVAT.toString();
    salesDeliveryAndOrderVatAmountController.text = data.vatAmount.toString();
    salesDeliveryAndOrderTotalController.text = data.total.toString();
    salesDeliveryLines = data.salesDeliveryLines!;
  }

  initSalesQuotationScreen(id) {
    var data =
        salesQuotationsModel!.data!.firstWhere((element) => element.id == id);
    salesQuotationTransactionNumberController.text =
        data.transactionNumber.toString();
    salesQuotationCustomerCodeController.text = data.customerCode.toString();
    salesQuotationSelectedAddressesController.text =
        data.customerAddresses!.map((e) => e.address).toList().join(",");
    salesQuotationSelectFactoryController.text = data.factoryName.toString();
    salesQuotationTransactionDateController.text =
        outputFormat.format(DateTime.parse(data.transactionDate!));

    salesQuotationStatusController.text = getSalesOrderStatus(data.status);
    salesQuotationSalesmanController.text = data.salesManName.toString();
    salesQuotationVatPercentageController.text = data.vatPercentage.toString();
    salesQuotationTotalBeforeVatController.text =
        data.totalBeforeVAT.toString();
    salesQuotationVatAmountController.text = data.vatAmount.toString();
    salesQuotationTotalController.text = data.total.toString();
    salesQuotationNoteController.text = data.notes ?? "";
    salesQuotationLines = data.salesQuotationLines!;
    unloadingIncluded = data.priceInfoList![1] == "true";
    woodenBassesIncluded = data.priceInfoList![0] == "true";
  }

  initPurchaseOrdersScreen(args) {
    purchaseOrdersTransactionNumberController.clear();
    purchaseOrdersCustomerCodeController.clear();
    purchaseOrdersSelectFactoryController.clear();
    purchaseOrdersTransactionDateController.clear();
    purchaseOrdersStatusController.clear();
    purchaseOrdersSalesmanController.clear();
    purchaseOrdersVatPercentageController.clear();
    purchaseOrdersTotalBeforeVatController.clear();
    purchaseOrdersVatAmountController.clear();
    purchaseOrdersTotalController.clear();
    purchaseOrdersNoteController.clear();
    purchaseOrdersLines!.clear();

    if (args["isAdd"]) {
      purchaseOrdersTransactionDateController.text =
          outputFormat.format(DateTime.now());

      return;
    }
    var data = purchaseOrdersModel!.data!
        .firstWhere((element) => element.id == args["orderId"]);
    print("data ${data.toJson()} ");

    purchaseOrdersTransactionNumberController.text =
        data.transactionNumber.toString();
    purchaseOrdersCustomerCodeController.text = data.customerCode.toString();
    /* purchaseOrdersSelectedAddressesController.text =
        data.customerAddresses!.map((e) => e.address).toList().join(","); */
    purchaseOrdersSelectFactoryController.text = data.factoryName.toString();
    purchaseOrdersTransactionDateController.text =
        outputFormat.format(DateTime.parse(data.transactionDate!));

    purchaseOrdersStatusController.text = getPurchaseOrderStatus(data.status);
    purchaseOrdersSalesmanController.text = data.salesManName.toString();
    purchaseOrdersVatPercentageController.text = data.vatPercentage.toString();
    purchaseOrdersTotalBeforeVatController.text =
        data.totalBeforeVAT.toString();
    purchaseOrdersVatAmountController.text = data.vatAmount.toString();
    purchaseOrdersTotalController.text = data.total.toString();
    purchaseOrdersNoteController.text = data.notes ?? "";
    purchaseOrdersLines = data.purchaseOrderLines!;
    print("purchaseOrdersLines $purchaseOrdersLines ");
  }

  initLoadingOrdersScreen(id) {
    var data =
        loadingOrdersModel!.data!.firstWhere((element) => element.id == id);
    loadingOrdersFactoryController.text = data.factoryName.toString();
    loadingOrdersClientNameController.text = data.customerName.toString();
    loadingOrdersLocationController.text = data.customerAddressName.toString();
    loadingOrdersProductController.text = data.itemName.toString();
    loadingOrdersQuantityController.text = data.quantity.toString();
    loadingOrdersCustomerReferenceNoController.text =
        data.customerRefNo.toString();
    loadingOrdersTransactionDateController.text =
        outputFormat.format(DateTime.parse(data.transactionDate!));
    loadingOrdersNoOfRequestsController.text = data.numberOfRequests.toString();
    if (dropDownDriversModel != null &&
        dropDownTransportersModel != null &&
        dropDownVehiclesModel != null) {
      loadingOrdersTransporterController.text = dropDownTransportersModel!.data!
          .firstWhere((element) => element.id == data.transporterId)
          .name
          .toString();

      loadingOrdersTruckController.text = dropDownVehiclesModel!.data!
          .firstWhere((element) => element.id == data.vehicleId)
          .name
          .toString();
      loadingOrdersDriverController.text =
          "${dropDownDriversModel!.data!.firstWhere((element) => element.id == data.driverId).firstName} ${dropDownDriversModel!.data!.firstWhere((element) => element.id == data.driverId).lastName}";
    }
  }

  initSalesOrderScreen(id) {
    var data = ordersModel!.data!.firstWhere((element) => element.id == id);
    salesDeliveryAndOrderTransactionNumberController.text =
        data.transactionNumber.toString();
    salesDeliveryAndOrderCustomerCodeController.text =
        data.customerCode.toString();
    salesDeliveryAndOrderCustomerNameController.text =
        data.customerName.toString();
    salesDeliveryAndOrderSelectFactoryController.text =
        data.factoryName.toString();
    salesDeliveryAndOrderTransactionDateController.text =
        outputFormat.format(DateTime.parse(data.transactionDate!));
    salesDeliveryAndOrderCustomerCurrentBalanceController.text =
        data.customerCurrentBalance.toString();
    salesDeliveryAndOrderCustomerCreditLimitController.text =
        data.customerCreditLimit.toString();
    salesDeliveryAndOrderStatusController.text = getOrderStatus(data.status);
    salesDeliveryAndOrderSalesmanController.text = data.salesManName.toString();
    salesDeliveryAndOrderVatPercentageController.text =
        data.vatPercentage.toString();
    salesDeliveryAndOrderTotalBeforeVatController.text =
        data.totalBeforeVAT.toString();
    salesDeliveryAndOrderVatAmountController.text = data.vatAmount.toString();
    salesDeliveryAndOrderTotalController.text = data.total.toString();
    salesOrdersLines = data.salesOrderLines!;
  }

  /* END VIEW SCREENS INIT */

  /* REPORT */
  setSelectedFromItem(value) {
    selectedFromItem = value;
    emit(ChangeSelectedItemState());
  }

  setSelectedToItem(value) {
    selectedToItem = value;
    emit(ChangeSelectedItemState());
  }
}
