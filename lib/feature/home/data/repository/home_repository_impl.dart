import 'package:demo/feature/home/data/remote/data_sources/home_remote_datasource.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.homeRemoteDatasource, required this.networkInfo});
}
