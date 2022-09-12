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
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  void initState() {
    super.initState();
    _initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [observer],
      navigatorKey: RouteNavigator.navigatorKey,
      onGenerateRoute: RouteNavigator.generateNamedRoute,
      routes: RouteNavigator.routesList,
      // TODO: implement Route navigation.
      onGenerateInitialRoutes: RouteNavigator.defaultGenerateInitialRoutes,
      initialRoute: RoutesList.initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }

  // Define an async function to
  // initialize FlutterFire
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
