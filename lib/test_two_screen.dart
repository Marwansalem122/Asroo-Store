import 'package:flutter/material.dart';

class TestTwoScreen extends StatelessWidget {
  const TestTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test TestTwoScreen Screen'),
      ),
      body:const Center(
        child: Text('This is Test TestTwoScreen Screen'),
      ),
    );
  }
}
