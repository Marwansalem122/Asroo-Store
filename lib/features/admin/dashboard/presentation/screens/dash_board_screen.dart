import 'package:asroo_store/core/di/inject_container.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/refactors/dash_board_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductsNumberBloc>()
            ..add(const ProductsNumberEvent.getProductsNumber()),
        ),
        BlocProvider(
          create: (context) => sl<CategoriesNumberBloc>()
            ..add(const CategoriesNumberEvent.getCategoriesNumber()),
        ),
        BlocProvider(
          create: (context) => sl<UsersNumberBloc>()
            ..add(const UsersNumberEvent.getUsersNumber()),
        ),
      ],
     child:  Scaffold(
    appBar: AppBar(
    title:const Text("DashBoardScreen"),
    ),
    body: const DashBoardBody(),
    ),
    );
  }
}
