import 'package:dartz/dartz.dart';
import '../services/api_service.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository({ApiService? apiService})
    : _apiService = apiService ?? ApiService();

  Future<Either<String, LoginResponseModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _apiService.login(
        LoginRequestModel(username: username, password: password),
      );
      return Right(result);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
