import 'package:asroo_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/di/inject_container.dart';
import 'package:asroo_store/core/helper/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/utils/custom_button.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/get_alladmin_categories/get_all_admin_categories_bloc.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/widgets/create/create_category_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategory extends StatelessWidget {
  const CreateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Categories',
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
                    create: (context) => sl<CreateCategoryBloc>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<UploadImageCubit>(),
                  ),
                ],
                child: const CreateCategoryBottomSheetWidget(),
              ),
              whenComplete: () {
                context.read<GetAllAdminCategoriesBloc>().add(
                      const GetAllAdminCategoriesEvent.fetchAdminCategories(
                          isNotLoading: false,),
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
