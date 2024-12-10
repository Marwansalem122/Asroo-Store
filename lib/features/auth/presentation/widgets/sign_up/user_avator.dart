import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';

class UserAvator extends StatelessWidget {
  const UserAvator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFadeInDown(
      duration: 500,
      child: CircleAvatar(
        radius: 38,
        backgroundImage: AssetImage(AppImages.userAvatar),
      ),
    );
  }
}
