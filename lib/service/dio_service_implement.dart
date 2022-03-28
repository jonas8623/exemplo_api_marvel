import 'package:api_marvel/constant.dart';
import 'package:api_marvel/service/dio_service.dart';
import 'package:dio/dio.dart';

class DioServiceImplement implements DioService {

  @override
  Dio getDio() => Dio(BaseOptions(baseUrl: Constant.baseUrl));
}
