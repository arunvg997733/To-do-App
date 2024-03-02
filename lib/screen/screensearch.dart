import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/model/db_model.dart';
import 'package:todoapp/screen/screendetailview.dart';

class ScreenSearch extends StatefulWidget {
   ScreenSearch ({super.key});

   

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {

  final searchvaluectr = TextEditingController();

  List <ListModel> searchlist = Hive.box<ListModel>('Database').values.toList();


  late List<ListModel> newlist = List<ListModel>.from(searchlist);


  @override
  Widget build(BuildContext context) {

    int x = -1;

    

    
    return  Scaffold(
      appBar: AppBar(title: Text('Search List'),centerTitle: true,),
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            controller: searchvaluectr,
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Search ',
            suffixIcon: IconButton(onPressed: (){
              clearsearch();
            }, icon: Icon(Icons.clear))),
            onChanged: (value) {
              
              searchlistfunction(value);
            },
      
          ),
          Expanded(child:newlist.isNotEmpty ? 
          ListView.separated(
            itemBuilder: (context, index) {
      
              
      
              final data = newlist[index];
              
              
      
              return ListTile(
                title: Text(data.subject),
                subtitle: Text(data.matter),
                onTap: () {
              
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ScreenDetailview(data: data, index:index)));
                },
              );
      
            }, 
            separatorBuilder: (context, index) {
              return Divider();
            }, 
            itemCount: newlist.length):Center(child: Text('No list available',style: TextStyle(fontSize: 20),)))
        ],),
      )),

    );
  }

  void searchlistfunction(String value){


    setState(() {
      
    newlist = searchlist.where((element) => element.subject.toLowerCase().contains(value.toLowerCase().trim())).toList();

    

    });
    




  }

  void clearsearch() {
    searchvaluectr.clear();
  }
}