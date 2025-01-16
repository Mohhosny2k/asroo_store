import 'package:asroo_store/core/features/auth/data/data_source/auth_data_source.dart';
import 'package:asroo_store/core/features/auth/data/models/login_request_body.dart';
import 'package:asroo_store/core/features/auth/data/models/login_response.dart';
import 'package:asroo_store/core/features/auth/data/models/user_role_response.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';

class AuthRepos {
  const AuthRepos(this._dataSource);
  final AuthDataSource _dataSource;

  //? login

  Future<ApiResult<LoginResponse>> login(
      {required LoginRequestBody body}) async {
    try {
      final response = await _dataSource.login(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const  ApiResult.failure(LangKeys.loggedError);
    }
  }

  //? get  userRole

  Future<UserRoleResponse> userRole(String token) async {
    final response = await _dataSource.userRole(token);

    return response;
  }
}
