import 'package:flutter/material.dart';
import 'package:reacount_2/Model/local_data.dart/sqflite.dart';
import 'package:reacount_2/model/app_entities/my_app.dart';

void main() {
  Sqflite.createDatabase();
  runApp(const MyApp());
}
