import 'package:demo/core/routing/routes_list.dart';
import 'package:flutter/material.dart';
import '../../feature/home/presentation/pages/home_page.dart';

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

  static void pop() {
    navigatorKey.currentState?.pop();
  }

  static Future<dynamic>? pushRepalcementNamed<Arguments>(
      {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static List<Route<dynamic>> defaultGenerateInitialRoutes(
      String initialRouteName) {
    List<MaterialPageRoute> routes = [];
    routes
        .add(MaterialPageRoute(builder: routesList[RoutesList.initialRoute]!));
    return routes;
  }

  static Route<dynamic>? generateNamedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesList.initialRoute:
        {
          break;
        }
      case RoutesList.homeRoute:
        {
          break;
        }

      default:
        throw Exception('This route name does not exit');
    }
  }
}
