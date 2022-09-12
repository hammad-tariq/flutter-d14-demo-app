part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure;
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String message;

  const HomeState({
    this.status = HomeStatus.initial,
    this.message = "",
  });

  @override
  List<Object?> get props => [status, message];
}
