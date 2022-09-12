import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../logger/app_logger.dart';
import '../logger/firebase_logger.dart';
import '../logger/pretty_dio_logger.dart';
import '../network/network_client.dart';
import '../network/network_info.dart';
import 'injection_container_cache.dart';

final serviceLocator = GetIt.I;

Future<void> initDI() async {
  serviceLocator.allowReassignment = true;

  // To LOG API Calls (DIO)
  serviceLocator.registerLazySingleton(() => Logger(
          printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: false,
      )));

  serviceLocator
      .registerLazySingleton(() => AppLogger(logger: serviceLocator()));

  // Initialize DB and Shared preferences.
  await initCacheDI();

  // Initialize DIO
  Dio _dio = Dio();
  BaseOptions baseOptions = BaseOptions(
      // Default receive timeout
      receiveTimeout: 30000,
      // Default connect timeout
      connectTimeout: 30000,
      baseUrl: "www.google.com",
      contentType: 'application/json',
      headers: {'Content-Type': 'application/json'},
      maxRedirects: 2);

  _dio.options = baseOptions;

  (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  _dio.interceptors.clear();

  // Logger for API calls.
  _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      error: true,
      request: true,
      compact: true,
      maxWidth: 90,
      requestHeader: true,
      responseBody: true,
      responseHeader: false));

  // If we need to call refresh access token API.
  // We can modify below network interceptor.
  _dio.interceptors.add(InterceptorsWrapper(onError: (DioError error, handler) {
    return handler.next(error);
  }, onRequest: (RequestOptions requestOptions, handler) async {
    // TODO:  Get latest access token from preferences
    var accessToken = "";
    if (accessToken != "") {
      var authHeader = {'Authorization': 'Bearer $accessToken'};
      requestOptions.headers.addAll(authHeader);
    }
    return handler.next(requestOptions);
  }, onResponse: (response, handler) async {
    return handler.next(response);
  }));

  serviceLocator.registerLazySingleton(() => _dio);

  // Firebase logger
  serviceLocator.registerLazySingleton(() => FirebaseLogger());

  // Network Client.
  serviceLocator.registerLazySingleton(() => NetworkClient(
      dio: serviceLocator(),
      logger: serviceLocator(),
      firebaseLogger: serviceLocator()));

  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
