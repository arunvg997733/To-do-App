import 'package:hive_flutter/adapters.dart';
part 'db_model.g.dart';

@HiveType(typeId: 1)
class ListModel{

  @HiveField(0)
  final String date;
  @HiveField(1)
  final String subject;
  @HiveField(2)
  final String matter;

  ListModel({required this.date,required this.subject,required this.matter});

}