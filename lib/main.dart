import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/function/db_function.dart';
import 'package:todoapp/model/db_model.dart';
import 'package:todoapp/screen/screenhome.dart';

Future <void> main()async{
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(ListModelAdapter().typeId)){

    Hive.registerAdapter(ListModelAdapter());

  }
  runApp(const MyApp());

  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: ScreenHome(),
    );
  }
}