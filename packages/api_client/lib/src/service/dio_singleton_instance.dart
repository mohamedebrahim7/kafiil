import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 8),
    receiveTimeout: const Duration(seconds: 8),
    headers: {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
    },
    receiveDataWhenStatusError: true,
    followRedirects: true,
    //  validateStatus: (status) => status! < 500,
  ),
);
