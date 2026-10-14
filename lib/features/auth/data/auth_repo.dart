import 'package:kickly/core/network/api_errors.dart';
import 'package:kickly/core/network/api_service.dart';
import 'package:kickly/core/utils/pref_helpers.dart';
import 'package:kickly/features/auth/data/user_model.dart';

class AuthRepo {
  final ApiService apiService = ApiService();

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post("/api/auth/login", {
        "email": email,
        "password": password,
      });

      final data = Map<String, dynamic>.from(response as Map);
      final user = UserModel.fromJson(data);

      await PrefHelpers.saveToken(user.accessToken);

      if (user.refreshToken != null) {
        await PrefHelpers.saveRefreshToken(user.refreshToken!);
      } else {
        await PrefHelpers.clearRefreshToken();
      }

      return user;
    } on ApiErrors {
      rethrow;
    } catch (e) {
      throw ApiErrors(detail: e.toString());
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await PrefHelpers.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        throw ApiErrors(detail: "No refresh token is available for logout");
      }

      await apiService.post("/api/auth/logout", {
        "refreshToken": refreshToken,
      });

      await PrefHelpers.clearTokens();
    } on ApiErrors {
      rethrow;
    } catch (e) {
      throw ApiErrors(detail: e.toString());
    }
  }

  ///register
  Future<Map<String, dynamic>?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await apiService.post("/api/auth/register", {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
      });

      if (response == null) {
        return null;
      }

      return Map<String, dynamic>.from(response as Map);
    } on ApiErrors {
      rethrow;
    } catch (e) {
      throw ApiErrors(detail: e.toString());
    }
  }
}
