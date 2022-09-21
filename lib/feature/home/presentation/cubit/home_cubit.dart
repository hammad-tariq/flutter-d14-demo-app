import 'package:demo/core/cubit/base_cubit.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  // TODO: Get reference to home repo. so we can use it.
  // TODO: Need to finish Service locator for this.

  // final HomeRepository homeRepo;

  HomeCubit() : super(const HomeState());

  void getEvents() async {
    emit(const HomeState(status: HomeStatus.loading));
  }
}
