import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/routing/route_navigator.dart';
import 'core/routing/routes_list.dart';
import 'core/util/constant.dart';

class AppBootStrapWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppBootStrapWidgetState();
  }
}

class AppBootStrapWidgetState extends State<AppBootStrapWidget> {
  @override
  void initState() {
    super.initState();
    // TODO: Commenting this for now, as we don't have Firebase project.
    // _initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteNavigator.navigatorKey,
      onGenerateRoute: RouteNavigator.generateNamedRoute,
      routes: RouteNavigator.routesList,
      // TODO: implement Route navigation.
      onGenerateInitialRoutes: RouteNavigator.defaultGenerateInitialRoutes,
      initialRoute: RoutesList.homeRoute,
      debugShowCheckedModeBanner: false,
    );
  }

  // Define an async function to
  // initialize FlutterFire
  // TODO: Complete Firebase project configuration.
  Future<void> _initializeFlutterFire() async {
    // Wait for Firebase to initialize
    if (kTestingCrashlytics) {
      // Force enable crashlytics collection enabled if we're testing it.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      // Else only enable it in non-debug builds.
      // You could additionally extend this to allow users to opt-in.
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
    // Pass all uncaught errors to Crashlytics.
    Function originalOnError = FlutterError.onError as Function;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      // Forward to original handler.
      originalOnError(errorDetails);
    };
  }
}
