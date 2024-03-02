import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/model/db_model.dart';

ValueNotifier<List<ListModel>> todolistnotifier = ValueNotifier([]);

void deletelist(int index)async{
final listdb = await Hive.openBox<ListModel>('Database');
listdb.deleteAt(index);
todolistnotifier.value.removeAt(index);
todolistnotifier.notifyListeners();


}

Future <void> addlist(ListModel data)async{

  final listdb = await Hive.openBox<ListModel>('Database');
  await listdb.add(data);
  todolistnotifier.value.add(data);
  todolistnotifier.notifyListeners();
  
}

Future <void> getalldetails()async{

  final listdb = await Hive.openBox<ListModel>('Database');
  todolistnotifier.value.clear();
  todolistnotifier.value.addAll(listdb.values);
  todolistnotifier.notifyListeners();
}

Future<void> Update(ListModel data,int index)async{

final listdb = await Hive.openBox<ListModel>('Database');

listdb.putAt(index, data);

getalldetails();



}



