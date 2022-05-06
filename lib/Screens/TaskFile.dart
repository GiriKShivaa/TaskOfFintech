

import 'package:flutter/material.dart';
import 'package:task_project_fintech/Widgets/AccountListWidget.dart';

class AccountData extends StatefulWidget {
  const AccountData({ Key? key }) : super(key: key);

  @override
  State<AccountData> createState() => _AccountDataState();
}

class _AccountDataState extends State<AccountData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Task"),),
      body:const  AccountLists(),
    );
  }
}