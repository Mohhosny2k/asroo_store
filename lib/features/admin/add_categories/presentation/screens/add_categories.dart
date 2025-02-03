import '../../../../../core/di/injection_container.dart';
import '../refactors/add_categories_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/admin_app_bar.dart';
import '../../../../../core/style/colors/colors_dark.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return 
  //  MultiBlocProvider(
  //     providers: [
        // BlocProvider(
        //   create: (context) => sl<GetAllAdminCategoriesBloc>()
        //     ..add(
        //       const GetAllAdminCategoriesEvent.fetchAdminCategories(
        //         isNotLoading: true,
        //       ),
        //     ),
        // ),
        // BlocProvider(
        //   create: (context) => sl<DeleteCategoryBloc>(),
        // ),
     // ],
     // child:
      
       const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Categories',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: AddCategoriesBody(),
      )
      ;
     // ,
   // );
  }
}
