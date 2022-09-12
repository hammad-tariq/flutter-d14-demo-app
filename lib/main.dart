import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bootstrap_widget.dart';

void main() {
  runApp(App());
}

// First or Parent widget of the application.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBootStrapWidget();
  }
}
