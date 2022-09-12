import '../../feature/home/presentation/cubit/home_cubit.dart';
import 'injection_container_common.dart';

Future<void> initPresentationDI() async {
  // Injection container for Cubit classes.
  serviceLocator.registerFactory<HomeCubit>(() => HomeCubit());
}
