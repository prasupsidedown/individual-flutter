import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await _dio.post('/auth/login', data: request.toJson());
    return LoginResponseModel.fromJson(response.data);
  }
}
