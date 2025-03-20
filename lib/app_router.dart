import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/domain/api/app_api.dart';
import 'package:template/presentation/screens/auth/login/login.dart';
import 'package:template/presentation/screens/auth/roles/add_roles.dart';
import 'package:template/presentation/screens/auth/roles/roles_screen.dart';
import 'package:template/presentation/screens/auth/users/add_user.dart';
import 'package:template/presentation/screens/auth/users/users_screen.dart';
import 'package:template/presentation/screens/homepage/driver/add_driver.dart';
import 'package:template/presentation/screens/homepage/driver/drivers_screen.dart';
import 'package:template/presentation/screens/homepage/driver_trips/driver_trips_screen.dart';
import 'package:template/presentation/screens/homepage/customer/customers_screen.dart';
import 'package:template/presentation/screens/homepage/loading_orders/view_loading_order.dart';
import 'package:template/presentation/screens/homepage/orders/view_order.dart';
import 'package:template/presentation/screens/homepage/purchase_orders/purchase_orders_screen.dart';
import 'package:template/presentation/screens/homepage/purchase_orders/view_purchase_orders.dart';
import 'package:template/presentation/screens/homepage/reports/account_statement_report.dart';
import 'package:template/presentation/screens/homepage/reports/financial_report.dart';
import 'package:template/presentation/screens/homepage/reports/sales_items_report.dart';
import 'package:template/presentation/screens/homepage/sales_delivery/sales_delivery_screen.dart';
import 'package:template/presentation/screens/homepage/factory/add_factory.dart';
import 'package:template/presentation/screens/homepage/factory/factory_screen.dart';
import 'package:template/presentation/screens/homepage/homepage.dart';
import 'package:template/presentation/screens/homepage/orders/orders_screen.dart';
import 'package:template/presentation/screens/homepage/products/products_screen.dart';
import 'package:template/presentation/screens/homepage/sales_delivery/view_sales_delivery.dart';
import 'package:template/presentation/screens/homepage/sales_quotation/sales_quotation_screen.dart';
import 'package:template/presentation/screens/homepage/sales_quotation/view_sales_quotation.dart';
import 'package:template/presentation/screens/homepage/transporter/add_transporter.dart';
import 'package:template/presentation/screens/homepage/transporter/transporter_screen.dart';
import 'package:template/presentation/screens/homepage/loading_orders/loading_orders_screen.dart';
import 'package:template/presentation/screens/homepage/vehicles.dart/add_vehicle.dart';
import 'package:template/presentation/screens/homepage/vehicles.dart/vehicles_screen.dart';
import 'package:template/presentation/splash_screen.dart';

import 'bloc/app_cubit.dart';
import 'bloc/auth/auth_cubit.dart';
import 'bloc/homepage/home_page_cubit.dart';
import 'constants/strings.dart';
import 'domain/api/auth_api.dart';
import 'domain/api/home_page_api.dart';
import 'domain/repos/app_repo.dart';
import 'domain/repos/auth_repo.dart';
import 'domain/repos/home_page_repo.dart';

class AppRouter {
  late AppRepo appRepo;
  late AppCubit appCubit;
  late AuthRepo authRepo;
  late AuthCubit authCubit;
  late HomePageRepo homePageRepo;
  late HomePageCubit homePageCubit;

  AppRouter() {
    appRepo = AppRepo(
      AppApi(),
    );
    appCubit = AppCubit(appRepo);
    authRepo = AuthRepo(
      AuthApi(),
    );
    authCubit = AuthCubit(authRepo);
    homePageRepo = HomePageRepo(
      HomePageApi(),
    );
    homePageCubit = HomePageCubit(homePageRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(authRepo),
            child: LoginScreen(),
          ),
        );

      case homePageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)
              ..getUserById(currentUser: true)
              ..getMainReport(),
            child: const HomePage(),
          ),
        );
      case usersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(authRepo)..getUsers(),
            child: UsersScreen(),
          ),
        );
      case rolesRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(authRepo)..getRoles(),
            child: RolesScreen(),
          ),
        );
      case customersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getCustomers(),
            child: CustomersScreen(),
          ),
        );
      case productsRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getProducts(),
            child: ProductsScreen(),
          ),
        );
      case vehiclesRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getVehicles(),
            child: VehiclesScreen(),
          ),
        );

      case ordersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getOrders(),
            child: OrdersScreen(),
          ),
        );

      case salesDeliveryRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HomePageCubit(homePageRepo)..getSalesDelivery(),
            child: SalesDeliveryScreen(),
          ),
        );
      case salesQuotationRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HomePageCubit(homePageRepo)..getSalesQuotations(),
            child: SalesQuotationsScreen(),
          ),
        );
      case purchaseOrdersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HomePageCubit(homePageRepo)..getPurchaseOrders(),
            child: PurchaseOrdersScreen(),
          ),
        );

      case loadingOrdersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HomePageCubit(homePageRepo)..getLoadingOrders(),
            child: LoadingOrdersScreen(),
          ),
        );
      case factoriesRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getFactories(),
            child: FactoryScreen(),
          ),
        );
      case driverTripsRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getDriverTrips(),
            child: DriverTripsScreen(),
          ),
        );
      case driversRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getDrivers(),
            child: DriversScreen(),
          ),
        );
      case transporterRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getTransporters(),
            child: TransporterScreen(),
          ),
        );

      case addUserRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<AuthCubit>(args["context"])
              ..getRoles(rolesScreen: false),
            child: AddUser(
              isEdit: args["isEdit"],
              userId: args["userId"],
            ),
          ),
        );
      case addRoleRoute:
        Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<AuthCubit>(args["context"]),
            child: AddRole(
              isEdit: args["isEdit"],
              roleId: args["roleId"],
            ),
          ),
        );
      case addFactoryRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"]),
            child: AddFactory(
              isEdit: args["isEdit"],
              factoryId: args["factoryId"],
            ),
          ),
        );

      case addDriverRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"])
              ..getDropDownVehicles(),
            child: AddDriver(
              isEdit: args["isEdit"],
              driverId: args["driverId"],
            ),
          ),
        );
      case addTransporterRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"]),
            child: AddTransporter(
              isEdit: args["isEdit"],
              transporterId: args["transporterId"],
            ),
          ),
        );
      case addVehicleRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"])
              ..getDropDownTransporters()
              ..getDropDownDrivers(),
            child: AddVehicle(
              isEdit: args["isEdit"],
              vehicleId: args["vehicleId"],
            ),
          ),
        );
      case viewSalesDeliveryRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"]),
            child: ViewSalesDelivery(
              deliveryId: args["deliveryId"],
            ),
          ),
        );
      case viewSalesQuotationRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"]),
            child: ViewSalesQuotation(
              quotationId: args["quotationId"],
            ),
          ),
        );

      case viewLoadingOrderRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"])
              ..getDropDownDrivers()
              ..getDropDownTransporters()
              ..getDropDownVehicles(),
            child: ViewLoadingOrders(
              orderId: args["orderId"],
            ),
          ),
        );
      case viewSalesOrderRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"]),
            child: ViewSalesOrder(
              orderId: args["orderId"],
            ),
          ),
        );
      case viewPurchaseOrderRoute:
        Map args = settings.arguments as Map;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<HomePageCubit>(args["context"])
              ..getFactories(fill: false)
              ..getProducts(fill: false)
              ..getCustomer(args["customerId"] ?? 0),
            child: ViewPurchaseOrders(
              orderId: args["orderId"],
              isEdit: args["isEdit"],
              isAdd: args["isAdd"],
            ),
          ),
        );
      case accountStatementReportRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo),
            child: const AccountStatementReport(),
          ),
        );
      case salesDetailsReportRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo)..getProducts(),
            child: const SalesItemsReport(),
          ),
        );
      case financialReportRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomePageCubit(homePageRepo),
            child: const FinancialReportScreen(),
          ),
        );
    }

    return null;
  }
}
