import 'package:demo/core/routing/routes_list.dart';
import 'package:demo/feature/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/home/presentation/pages/home_page.dart';
import '../di/injection_container_common.dart';

class RouteNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  NavigatorState get _navigator => navigatorKey.currentState!;

  static final routesList = {
    // TODO: ADD REMAINING APPLICATION ROUTES.
    RoutesList.homeRoute: (context) => HomePage(),
  };

  static Future<dynamic>? pushNamed<Arguments>(
      {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void pop({dynamic data}) {
    navigatorKey.currentState?.pop(data);
  }

  static Future<dynamic>? pushRepalcementNamed<Arguments>(
      {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static List<Route<dynamic>> defaultGenerateInitialRoutes(
      String initialRouteName) {
    List<MaterialPageRoute> routes = [];
    routes.add(MaterialPageRoute(builder: routesList[RoutesList.homeRoute]!));
    return routes;
  }

  static Route<dynamic>? generateNamedRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case RoutesList.initialRoute:
        {
          break;
        }
      case RoutesList.homeRoute:
        {
          page = BlocProvider<HomeCubit>(
              create: (context) => serviceLocator<HomeCubit>(),
              child: HomePage());
          break;
        }

      default:
        throw Exception('This route name does not exit');
    }
    return CustomPageRoute(builder: (context) => page);
  }
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  CustomPageRoute({builder}) : super(builder: builder);
}
