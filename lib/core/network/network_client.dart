import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

import '../error/exception.dart';
import '../logger/app_logger.dart';
import '../logger/firebase_logger.dart';

class NetworkClient {
  final Dio dio;
  final AppLogger logger;
  final FirebaseLogger firebaseLogger;

  NetworkClient(
      {required this.dio, required this.logger, required this.firebaseLogger});

  Future<Response> invoke(String url, RequestType requestType,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic requestBody}) async {
    Response? response;
    try {
      switch (requestType) {
        case RequestType.get:
          response = await dio.get(url,
              queryParameters: queryParameters,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
        case RequestType.post:
          response = await dio.post(url,
              queryParameters: queryParameters,
              data: requestBody,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
        case RequestType.put:
          response = await dio.put(url,
              queryParameters: queryParameters,
              data: requestBody,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
        case RequestType.delete:
          response = await dio.delete(url,
              queryParameters: queryParameters,
              data: requestBody,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
        case RequestType.patch:
          response = await dio.patch(url,
              queryParameters: queryParameters,
              data: requestBody,
              options:
                  Options(responseType: ResponseType.json, headers: headers));
          break;
      }
      return response;
    } on DioError catch (dioError) {
      logger.e('$runtimeType on DioError:-  $dioError', StackTrace.current);
      FirebaseCrashlytics.instance
          .recordFlutterError(FlutterErrorDetails(exception: dioError));
      throw ServerException(dioError: dioError);
    } on SocketException catch (exception) {
      logger.e(
          '$runtimeType on SocketException:-  $exception', StackTrace.current);
      FirebaseCrashlytics.instance
          .recordFlutterError(FlutterErrorDetails(exception: exception));
      rethrow;
    }
  }
}

// Types used by invoke API.
enum RequestType { get, post, put, delete, patch }
