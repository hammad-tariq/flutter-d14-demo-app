import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<State> extends BlocBase<State> {
  /// {@macro cubit}
  BaseCubit(State initialState) : super(initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  String handleException(Exception exception) {
    var message = "";
    // TODO: handle Exception
    return message;
  }
}
