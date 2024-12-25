import 'package:asroo_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/di/inject_container.dart';
import 'package:asroo_store/core/helper/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/utils/custom_button.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/get_alladmin_categories/get_all_admin_categories_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/create/create_prodcut_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/get_all_admin_product/get_all_admin_product_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/widgets/create/create_product_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Products',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.medium,
            fontFamily: FontFamilyHelper.poppinsEnglish,
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl<CreateProdcutBloc>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<UploadImageCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<GetAllAdminCategoriesBloc>()
                      ..add(
                        const GetAllAdminCategoriesEvent.fetchAdminCategories(
                          isNotLoading: false,
                        ),
                      ),
                  ),
                ],
                child: const CreateProductBottomSheet(),
              ),
              whenComplete: () {
                context.read<GetAllAdminProductBloc>().add(
                      const GetAllAdminProductEvent.getAllProducts(
                        isNotLoading: false,
                      ),
                    );
              },
            );
          },
          backgroundColor: DarkColors.blueDark,
          lastRadius: 10,
          threeRadius: 10,
          text: 'Add',
          width: 90.w,
          height: 35.h,
        ),
      ],
    );
  }
}
