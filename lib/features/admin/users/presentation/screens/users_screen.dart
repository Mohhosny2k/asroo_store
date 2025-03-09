import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/style/colors/colors_dark.dart';
import '../bloc/delete_user/delete_user_bloc.dart';
import '../bloc/get_all_users/get_all_users_bloc.dart';
import '../refators/users_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllUsersBloc>()
            ..add(
              const GetAllUsersEvent.getAllUsers(isNotLoading: true),
            ),
        ),
        BlocProvider(create: (context) => sl<DeleteUserBloc>()),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Users',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: UsersBody(),
      ),
    );
  }
}