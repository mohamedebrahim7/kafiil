import 'package:api_client/src/service/api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_singleton_instance.dart';

final apiClient = ApiClient(dio);

void prettyDioLogger() {
  dio.interceptors.add(PrettyDioLogger());
}
