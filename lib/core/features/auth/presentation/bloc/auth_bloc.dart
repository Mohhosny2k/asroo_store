import 'dart:async';
import 'package:asroo_store/core/features/auth/data/models/login_request_body.dart';
import 'package:asroo_store/core/features/auth/data/repos/auth_repo.dart';
import 'package:asroo_store/core/service/shared_pref/pref_keys.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "package:flutter_bloc/flutter_bloc.dart";
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repos) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }
  final AuthRepos _repos;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //? login
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _repos.login(
        body: LoginRequestBody(
            email: emailController.text.trim(),
            password: passwordController.text));

    await result.when(
      success: (response) async {
        //* user Token
        final token = response.data.login.accessToken ?? '';

        //* save token in shared pref
        await SharedPref().setString(PrefKeys.accessToken, token);

        //* get user role

        final user = await _repos.userRole(token);
        await SharedPref().setInt(PrefKeys.userId, user.userId ??0);
        emit( AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }
}
