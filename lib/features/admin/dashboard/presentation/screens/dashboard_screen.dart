import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/style/colors/colors_dark.dart';
import '../bloc/categories_number/categories_number_bloc.dart';
import '../bloc/products_number/products_number_bloc.dart';
import '../bloc/users_number/users_number_bloc.dart';
import '../refactors/dashboard_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> sl<ProductsNumberBloc>()..add(const ProductsNumberEvent.getProductsNumber()),),
        BlocProvider(create: (context)=> sl<CategoriesNumberBloc>()..add(const CategoriesNumberEvent.getCategoriesNumber()),),
        BlocProvider(create: (context)=> sl<UsersNumberBloc>()..add(const UsersNumberEvent.getUsersNumber()),),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'DashBoard',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
            body: DashBoardBody(),
          
      ),
    );
  }
}