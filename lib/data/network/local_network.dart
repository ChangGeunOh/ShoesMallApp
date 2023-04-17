import 'package:dio/dio.dart';

Dio localNetwork() {
  final dio = Dio();
  dio.interceptors.add(
    CustomInterceptor(),
  );
  return dio;
}


class CustomInterceptor extends Interceptor {
  // final LocalDataStore dataStore;
  // final Ref ref;

  // CustomInterceptor({
  //   required this.dataStore,
  //   required this.ref,
  // });

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // print('${err.response.toString()}');
    // final provider = ref.read(networkMessageProvider.notifier);
    // final statusCode = err.response?.statusCode ?? 0;
    // final statusMessage = err.response?.statusMessage ?? '';
    //
    // provider.setNetworkMessageData(NetworkMessageData(code: statusCode, message: statusMessage));

    print('onError');

    // super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    print('onRequest');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    print('onResponse');
  }
}
