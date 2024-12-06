import 'package:asroo_store/core/helper/navigation_extension.dart';
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
            const Text('This is Test One Screen'),
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
