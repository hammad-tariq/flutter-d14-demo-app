import 'package:dartz/dartz.dart';
import 'package:demo/core/error/exception.dart';
import 'package:demo/feature/home/data/remote/data_sources/home_remote_datasource.dart';
import 'package:demo/feature/home/data/remote/model/GeekEventsResponse.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.homeRemoteDatasource, required this.networkInfo});

  @override
  Future<Either<Exception, GeekEventsResponse>> getGeekEventsApi(
      String param) async {
    if (networkInfo.isConnected) {
      try {
        final response = await homeRemoteDatasource.getGeekEventsApi(param);
        return Right(GeekEventsResponse.fromJson(response));
      } on ServerException catch (exception) {
        return Left(ServerException(dioError: exception.dioError));
      }
    } else {
      return Left(NoInternetException(message: "no_internet_connection"));
    }
  }
}
