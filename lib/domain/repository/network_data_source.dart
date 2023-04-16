import 'package:dio/dio.dart' hide Headers;
import 'package:shoes_mall/domain/model/user_data.dart';
import 'package:retrofit/retrofit.dart';

part 'network_data_source.g.dart';

@RestApi()
abstract class NetworkDataSource {

  factory NetworkDataSource(Dio dio, {String baseUrl}) = _NetworkDataSource;

  @POST('/login')
  Future<UserData> login(@Body() Map<String, dynamic> loginData);
}