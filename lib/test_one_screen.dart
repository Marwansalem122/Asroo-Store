import 'package:asroo_store/core/helper/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/routes/routes.dart';
import 'package:flutter/material.dart';

class TestOneScreen extends StatelessWidget {
  const TestOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test One Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is Test One Screen',
                style: TextStyle(color: context.color.bluePinkDark)),
            Text(context.translate(LangKeys.email),
                style: TextStyle(color: context.color.bluePinkDark)),
            Image.asset(context.assets.bigNavBar ?? ""),
            TextButton(
                onPressed: () {
                  context.pushNamed(Routes.testTwoScreen);
                },
                child: const Text("Go"))
          ],
        ),
      ),
    );
  }
}
