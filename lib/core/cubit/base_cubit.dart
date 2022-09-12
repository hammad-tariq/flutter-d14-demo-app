import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<State> extends BlocBase<State> {
  /// {@macro cubit}
  BaseCubit(State initialState) : super(initialState);
}
