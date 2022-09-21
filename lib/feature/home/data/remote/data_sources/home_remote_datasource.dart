import 'package:dio/dio.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/network/network_client.dart';

class HomeRemoteDatasource {
  final NetworkClient networkClient;

  HomeRemoteDatasource({required this.networkClient});

  Future<dynamic> getGeekEventsApi(String param) async {
    var response = await networkClient.invoke('', RequestType.get);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw ServerException(
          dioError: DioError(
              requestOptions: response.requestOptions,
              error: response,
              type: DioErrorType.response));
    }
  }
}
