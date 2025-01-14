import 'package:asroo_store/core/features/auth/data/models/login_response.dart';
import 'package:asroo_store/core/features/auth/data/models/user_role_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

//https://api.escuelajs.co/api/v1/auth/profile
@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> mutation,
  );

  @GET('api.escuelajs.co/api/v1/auth/profile')
//   /// user
//   ///
//   /// - [mutation]
//   ///   - variables: { "id": int }
//   ///   - query: user(id: $id) { id, name, email, role }

  Future<UserRoleResponse> userRole(
    @Body() Map<String, dynamic> getUserRole ,
  );
}
