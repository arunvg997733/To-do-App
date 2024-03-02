import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/function/db_function.dart';
import 'package:todoapp/model/db_model.dart';
import 'package:todoapp/screen/screenhome.dart';

class ScreenEdit extends StatefulWidget {
   ScreenEdit({super.key,required this.data,required this.index});

  ListModel data;
  int index;

  @override
  State<ScreenEdit> createState() => _ScreenEditState();
}

class _ScreenEditState extends State<ScreenEdit> {
   
  var dateeditctr = TextEditingController();

  var subjecteditctr = TextEditingController();

  var mattereditctr = TextEditingController();

  @override
  Widget build(BuildContext context) {

    dateeditctr.text = widget.data.date;
    subjecteditctr.text = widget.data.subject;
    mattereditctr.text = widget.data.matter;

    return Scaffold(

      appBar: AppBar(
        title:Text('To Do List details'),centerTitle: true ,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit))
        ],
        ),
        resizeToAvoidBottomInset: false,
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
      
          const SizedBox(height: 25),
      
          Center(child: TextFormField(
          readOnly: true,
          controller: dateeditctr,
          decoration: InputDecoration(border: OutlineInputBorder()),
          

          onTap:()async {

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
                      dateeditctr.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
            

          },

          )),
      
          const SizedBox(height: 20),
      
          Center(child: TextFormField(
            controller: subjecteditctr,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          )),
      
          const SizedBox(height: 20),
      
          TextFormField(
            controller: mattereditctr,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),

          const SizedBox(height: 20),

          ElevatedButton(onPressed: (){

            Edit();

          }, child: Text('Update'))
          
        ],),
      )),
    );
  }

  void Edit(){

    final date = dateeditctr.text;
    final subject = subjecteditctr.text;
    final matter = mattereditctr.text;

  
    if(date.isEmpty || subject.isEmpty || matter.isEmpty){

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(behavior: SnackBarBehavior.floating ,content: Text('Please fill all the field')));
    }else{

      final editlist = ListModel(date: date, subject: subject, matter: matter);

      Update(editlist,widget.index);

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>ScreenHome()), (route) => false);

    }

  }
 
}

