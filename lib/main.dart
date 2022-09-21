import 'dart:async';
import 'package:demo/core/di/injection_container_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bootstrap_widget.dart';
import 'core/cubit/cubit_observer.dart';
import 'core/di/injection_container_presentation.dart';

void main() async {
  runZonedGuarded(() async {
    await BlocOverrides.runZoned(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        initDI();
        initPresentationDI();
        FlutterError.onError = (FlutterErrorDetails details) {
          FlutterError.presentError(details);
        };
        runApp(
          App(),
        );
      },
      blocObserver: CubitObserver(),
    );
  }, (error, stackTrace) {
    debugPrint("runZonedGuarded Error: $error");
  });
}

// First or Parent widget of the application.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBootStrapWidget();
  }
}
