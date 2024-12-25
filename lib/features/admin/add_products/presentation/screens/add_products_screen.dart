import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/di/inject_container.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/delete/delete_product_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/get_all_admin_product/get_all_admin_product_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/refactors/add_products_body.dart';
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
        backgroundColor: DarkColors.mainColor,
        appBar: AdminAppBar(
          title: 'Products',
          isMain: true,
          backgroundColor: DarkColors.mainColor,
        ),
        body: AddProductsBody(),
      ),
    );
  }
}
