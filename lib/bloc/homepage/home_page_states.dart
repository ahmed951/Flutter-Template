part of 'home_page_cubit.dart';

@immutable
sealed class HomePageStates {}

final class HomePageCubitInitial extends HomePageStates {}

final class HomePageBottomNavState extends HomePageStates {}

final class HomePageUpdateState extends HomePageStates {}

class GetUserLoadingState extends HomePageStates {}

class GetUserSuccessState extends HomePageStates {}

class GetUserErrorState extends HomePageStates {}

class SearchCustomersState extends HomePageStates {}

class GetCustomersLoadingState extends HomePageStates {}

class GetCustomersSuccessState extends HomePageStates {}

class GetCustomersErrorState extends HomePageStates {}

class ChangeVisibleItemState extends HomePageStates {}

class SearchProductsState extends HomePageStates {}

class GetProductsLoadingState extends HomePageStates {}

class GetProductsSuccessState extends HomePageStates {}

class GetProductsErrorState extends HomePageStates {}

class SearchVehiclesState extends HomePageStates {}

class GetVehiclesLoadingState extends HomePageStates {}

class GetVehiclesSuccessState extends HomePageStates {}

class GetVehiclesErrorState extends HomePageStates {}

class SearchOrdersState extends HomePageStates {}

class GetOrdersLoadingState extends HomePageStates {}

class GetOrdersSuccessState extends HomePageStates {}

class GetOrdersErrorState extends HomePageStates {}

class SearchSalesDeliveryState extends HomePageStates {}

class GetSalesDeliveryLoadingState extends HomePageStates {}

class GetSalesDeliverySuccessState extends HomePageStates {}

class GetSalesDeliveryErrorState extends HomePageStates {}

class SearchLoadingOrdersState extends HomePageStates {}

class GetLoadingOrdersLoadingState extends HomePageStates {}

class GetLoadingOrdersSuccessState extends HomePageStates {}

class GetLoadingOrdersErrorState extends HomePageStates {}

class DeleteVehicleLoadingState extends HomePageStates {}

class DeleteVehicleSuccessState extends HomePageStates {}

class DeleteVehicleErrorState extends HomePageStates {}

class GetDriverTripsLoadingState extends HomePageStates {}

class GetDriverTripsSuccessState extends HomePageStates {}

class GetDriverTripsErrorState extends HomePageStates {}

class SearchDriverTripsState extends HomePageStates {}

class SearchFactoriesState extends HomePageStates {}

class GetFactoriesLoadingState extends HomePageStates {}

class GetFactoriesSuccessState extends HomePageStates {}

class GetFactoriesErrorState extends HomePageStates {}

class DeleteFactoryLoadingState extends HomePageStates {}

class DeleteFactorySuccessState extends HomePageStates {}

class DeleteFactoryErrorState extends HomePageStates {}

class AddFactoryLoadingState extends HomePageStates {}

class AddFactorySuccessState extends HomePageStates {}

class AddFactoryErrorState extends HomePageStates {}

class EditFactoryLoadingState extends HomePageStates {}

class EditFactorySuccessState extends HomePageStates {}

class EditFactoryErrorState extends HomePageStates {}

class ChangeCheckBoxStatusState extends HomePageStates {}

class GetDriversLoadingState extends HomePageStates {}

class GetDriversSuccessState extends HomePageStates {}

class GetDriversErrorState extends HomePageStates {}

class DeleteDriverLoadingState extends HomePageStates {}

class DeleteDriverSuccessState extends HomePageStates {}

class DeleteDriverErrorState extends HomePageStates {}

class SearchDriversState extends HomePageStates {}

class AddDriverLoadingState extends HomePageStates {}

class AddDriverSuccessState extends HomePageStates {}

class AddDriverErrorState extends HomePageStates {}

class SearchTransporterState extends HomePageStates {}

class AddTransporterLoadingState extends HomePageStates {}

class AddTransporterSuccessState extends HomePageStates {}

class AddTransporterErrorState extends HomePageStates {}

class EditDriverLoadingState extends HomePageStates {}

class EditDriverSuccessState extends HomePageStates {}

class EditDriverErrorState extends HomePageStates {}

class SetDropdownState extends HomePageStates {}

class GetTransporterLoadingState extends HomePageStates {}

class GetTransporterSuccessState extends HomePageStates {}

class GetTransporterErrorState extends HomePageStates {}

class EditTransporterLoadingState extends HomePageStates {}

class EditTransporterSuccessState extends HomePageStates {}

class EditTransporterErrorState extends HomePageStates {}

class DeleteTransporterLoadingState extends HomePageStates {}

class DeleteTransporterSuccessState extends HomePageStates {}

class DeleteTransporterErrorState extends HomePageStates {}

class AddVehicleLoadingState extends HomePageStates {}

class AddVehicleSuccessState extends HomePageStates {}

class AddVehicleErrorState extends HomePageStates {}

class EditVehicleLoadingState extends HomePageStates {}

class EditVehicleSuccessState extends HomePageStates {}

class EditVehicleErrorState extends HomePageStates {}

class PickImageState extends HomePageStates {}

class CompleteLoadingOrderLoadingState extends HomePageStates {}

class CompleteLoadingOrderSuccessState extends HomePageStates {}

class CompleteLoadingOrderErrorState extends HomePageStates {}

class GetMainReportLoadingState extends HomePageStates {}

class GetMainReportSuccessState extends HomePageStates {}

class GetMainReportErrorState extends HomePageStates {}

class GetSalesQuotationLoadingState extends HomePageStates {}

class GetSalesQuotationSuccessState extends HomePageStates {}

class GetSalesQuotationErrorState extends HomePageStates {}

class SearchSalesQuotationState extends HomePageStates {}

class GetPurchaseOrdersLoadingState extends HomePageStates {}

class GetPurchaseOrdersSuccessState extends HomePageStates {}

class GetPurchaseOrdersErrorState extends HomePageStates {}

class SearchPurchaseOrdersState extends HomePageStates {}

class EditSalesQuotationLoadingState extends HomePageStates {}

class EditSalesQuotationSuccessState extends HomePageStates {}

class EditSalesQuotationErrorState extends HomePageStates {}

class GetUnitPriceForCustomerLoadingState extends HomePageStates {}

class GetUnitPriceForCustomerSuccessState extends HomePageStates {}

class GetUnitPriceForCustomerErrorState extends HomePageStates {}

class AddPurchaseOrderLineState extends HomePageStates {}

class HomePageUpdateQuantityState extends HomePageStates {}

class AddPurchaseOrderLoadingState extends HomePageStates {}

class AddPurchaseOrderSuccessState extends HomePageStates {}

class AddPurchaseOrderErrorState extends HomePageStates {}

class GetAccountStatementLoadingState extends HomePageStates {}

class GetAccountStatementSuccessState extends HomePageStates {}

class GetAccountStatementErrorState extends HomePageStates {}

class GetSalesItemsLoadingState extends HomePageStates {}

class GetSalesItemsSuccessState extends HomePageStates {}

class GetSalesItemsErrorState extends HomePageStates {}

class ChangeSelectedItemState extends HomePageStates {}

class GetFinancialReportLoadingState extends HomePageStates {}

class GetFinancialReportSuccessState extends HomePageStates {}

class GetFinancialReportErrorState extends HomePageStates {}

class SearchFinancialReportState extends HomePageStates {}
