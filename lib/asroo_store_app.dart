import 'package:asroo_store/core/app/env.variables.dart';
import 'package:flutter/material.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asroo Store',
      debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
      theme: ThemeData(
        
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Asroo Store'),
        ),
      ),
    );
  }
}