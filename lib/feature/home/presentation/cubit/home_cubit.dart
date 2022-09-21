import 'package:demo/core/cubit/base_cubit.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeState());
}
