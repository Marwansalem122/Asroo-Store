import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
              image: AssetImage(AppImages.noNetwork),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
