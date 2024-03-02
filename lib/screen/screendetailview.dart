import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/model/db_model.dart';
import 'package:todoapp/screen/screenedit.dart';

class ScreenDetailview extends StatelessWidget {
   ScreenDetailview({super.key,required this.data,required this.index});

  ListModel data;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('To Do List details'),centerTitle: true ,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ScreenEdit(data: data,index: index,)));
          }, icon: Icon(Icons.edit))
        ],
        ),
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
      
          const SizedBox(height: 25),
      
          Center(child: Text(data.date,style: TextStyle(fontSize: 20),)),
      
          const SizedBox(height: 20),
      
          Center(child: Text(data.subject,style: TextStyle(fontSize: 25),)),
      
          const SizedBox(height: 20),
      
          Text(data.matter)
          
      
      
          
      
        ],),
      )),
    );
  }
}