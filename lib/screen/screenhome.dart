import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/function/db_function.dart';
import 'package:todoapp/model/db_model.dart';
import 'package:todoapp/screen/screenadd.dart';
import 'package:todoapp/screen/screendetailview.dart';
import 'package:todoapp/screen/screensearch.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {

    getalldetails();

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ScreenSearch()));
            
          }, icon: Icon(Icons.search))
        ],
        ),
        body: SafeArea(child: 
        ValueListenableBuilder(
          valueListenable: todolistnotifier,
          builder: (BuildContext ctx, List<ListModel> listdetails, Widget? child){
            return ListView.separated(
            itemBuilder: (context, index){
              final data = listdetails[index];
              return (ListTile(
                title: Text('Subject - ${data.subject}',style: TextStyle(fontSize: 20),),
                subtitle: Text('Date - ${data.date}\nMatter - ${data.matter}'),
                trailing: Wrap(
                  children:<Widget>[ 

                    IconButton(onPressed: (){

                      showDialog(context: context, builder: (ctx){

                        return AlertDialog(
                          title: Text('Are you sure to delete'),
                          actions: [
                            TextButton(onPressed: (){

                              deletelist(index);

                              Navigator.of(context).pop(MaterialPageRoute(builder: (ctx)=> ScreenHome()));

                            }, child: Text('Yes')),

                            TextButton(onPressed: (){

                              Navigator.of(context).pop(MaterialPageRoute(builder: (ctx)=> ScreenHome()));

                            }, child: Text('No'))

                          ],
                        );
                      });
                    
                  }, icon:Icon(Icons.delete)),

                  

                ]
                ),
                onTap:() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ScreenDetailview(data: data,index: index,)));
                },
              ));
            }, 
            separatorBuilder:(context, index){
              return const Divider();
            }, 
            itemCount: listdetails.length);
          },
           
        )
        ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ScreenAdd()));
          },child: const Icon(Icons.add),),
        
    );
  }
}