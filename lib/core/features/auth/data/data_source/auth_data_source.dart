import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/user_role_response.dart';
import '../../../../service/graphql/api_service.dart';
import '../../../../service/graphql/qraphql_queries/auth/auth_queries.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthDataSource {
const  AuthDataSource(
   this. _graphql,
  ) ;

  final ApiService _graphql; 


  // ? login 
  Future<LoginResponse> login({required LoginRequestBody body}) async {
    final response= _graphql.login(AuthQueries().loginMapQuery(loginRequestBody: body));
    return  response;
  }

  // ? userRole
  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization']= 'Bearer $token';
    final client= ApiService(dio);
    final response=await client.userRole({});
    debugPrint('userRoleResponse: ${response.userRole}');
    return  response;
  }
}
