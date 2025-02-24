import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/style/colors/colors_dark.dart';
import '../bloc/delete_product/delete_product_bloc.dart';
import '../bloc/get_all_admin_product/get_all_admin_product_bloc.dart';
import '../refactors/add_products_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllAdminProductBloc>()
            ..add(
              const GetAllAdminProductEvent.getAllProducts(isNotLoading: true),
            ),
        ),
        BlocProvider(create: (context) => sl<DeleteProductBloc>()),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Products',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: AddProductsBody(),
      ),
    );
  }
}