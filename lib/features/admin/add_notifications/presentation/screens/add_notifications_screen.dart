import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:flutter/material.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Notifications',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {}, child: const Text('Send Notification')),
          ],
        ),
      ),
    );
  }
}
