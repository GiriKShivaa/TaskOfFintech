import 'package:flutter/material.dart';
import 'package:task_project_fintech/Screens/TaskFile.dart';

void main() =>
  runApp(const TAskApp());



class TAskApp extends StatelessWidget {
  const TAskApp({ Key? key }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AccountData() ,
    );
  }
}

