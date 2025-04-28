import 'package:flutter/material.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';

class HomeCustomerScreen extends StatelessWidget {
  const HomeCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      appBar: AppBar(
         backgroundColor: context.color.mainColor,
        title: const Text('Home Customer' , style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: Text('Home Customer Screen'),
      ),
    );
  }
}