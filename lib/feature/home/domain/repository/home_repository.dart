import 'package:dartz/dartz.dart';

import '../../data/remote/model/GeekEventsResponse.dart';

abstract class HomeRepository {
  Future<Either<Exception, GeekEventsResponse>> getGeekEventsApi(String param);
}
