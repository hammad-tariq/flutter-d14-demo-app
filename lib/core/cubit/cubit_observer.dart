import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class CubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    debugPrint('onCreate: (${bloc.runtimeType}, $bloc)');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('onChange: (${bloc.runtimeType}, $change)');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition: (${bloc.runtimeType}, $transition)');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError: (${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose: (${bloc.runtimeType} )');
    super.onClose(bloc);
  }
}
