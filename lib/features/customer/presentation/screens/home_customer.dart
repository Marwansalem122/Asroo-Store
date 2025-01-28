import 'package:asroo_store/core/helper/extensions/context_extension.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCustomerScreen extends StatelessWidget {
  const HomeCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      appBar: AppBar(
        title:const Text('Home Customer',style: TextStyle(
          color: Colors.white),),
        ),
    body: Center(
      child: TextButton(onPressed: (){
        FirebaseMessaging.instance.getToken().then(print);
      }, child:  Text('Get Token',
      style: TextStyle(fontSize: 24.sp),
      ),),
    ),
    );
  }
}
