import '../../../../features/auth/data/models/login_request_body.dart';

class AuthQueries {
  const AuthQueries._();

  factory AuthQueries() => _instance;
  static const AuthQueries _instance = AuthQueries._();


  Map<String, dynamic> loginMapQuery({required LoginRequestBody loginRequestBody}) {
    return {
      'query':r'''
        mutation Login($email: String!, $password: String!) {
          login(email: "$email", password: "$password") {
            accessToken
            refreshToken
          }
        }
      ''',
      'variables': {
        'email': loginRequestBody.email,
        'password': loginRequestBody.password,
      },
    };
  }
}
