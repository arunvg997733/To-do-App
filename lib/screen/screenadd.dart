import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/function/db_function.dart';
import 'package:todoapp/model/db_model.dart';
import 'package:todoapp/screen/screenhome.dart';


class ScreenAdd extends StatefulWidget {
   ScreenAdd({super.key});

  @override
  State<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {

  final datectr = TextEditingController();
  final subjectctr = TextEditingController();
  final matterctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new list'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [

          const SizedBox(height: 15),


          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Date'),
            controller: datectr,
            readOnly: true,
            onTap: ()async {
      
              
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));
       
                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      datectr.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
              
            },
          ),

          const SizedBox(height: 15),
      
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder(),hintText: 'Subject'),
            controller: subjectctr,
          ),

          const SizedBox(height: 15),

          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder(),hintText: 'Matter'),
            controller: matterctr,
          ),

          const SizedBox(height: 30),

          ElevatedButton(onPressed: (){

            newlistadd();


            
          }, child: const Text('Add'))
          
        ],),
      )),
    );
  }

  void newlistadd(){

    final date = datectr.text;
    final subject = subjectctr.text;
    final matter = matterctr.text;

    final newlist = ListModel(date: date, subject: subject, matter: matter);

    if(date.isEmpty || subject.isEmpty || matter.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text('Enter all field correctly')));
    }else{

      addlist(newlist);
      Navigator.of(context).pop(MaterialPageRoute(builder: (ctx)=>ScreenHome()));


    }

     

     

    
  }
}