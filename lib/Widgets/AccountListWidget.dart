import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_project_fintech/Models/ListOfAccounts.dart';
import 'package:task_project_fintech/Widgets/RichTextWidget.dart';

class AccountLists extends StatefulWidget {
  const AccountLists({Key? key}) : super(key: key);

  @override
  State<AccountLists> createState() => _AccountListsState();
}

class _AccountListsState extends State<AccountLists> {
  ListOfAccountData? listOfAccountData;
  @override
  void initState() {
    super.initState();
    getAccountListdata();
  }

  @override
  Widget build(BuildContext 
  context) {
    return listOfAccountData != null
        ? Column(
          children: [

            //  Text("Name : ${listOfAccountData!.data.name}"),
             RichTextWidget(firstText: " Name : ", secondText: listOfAccountData!.data.name),

             RichTextWidget(firstText: " Email : ", secondText: listOfAccountData!.data.email),

             RichTextWidget(firstText: " Mobile No : ", secondText: listOfAccountData!.data.mobile),

             RichTextWidget(firstText: " Pan No : ", secondText: listOfAccountData!.data.pan),

             RichTextWidget(firstText: " Credit Score : ", secondText: listOfAccountData!.data.creditScore.toString()),

             RichTextWidget(firstText: " Address : ", secondText: listOfAccountData!.data.address.toString()),

            Card(
              elevation: 7,
              
              shape:BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)) ,
              child: SizedBox(
                
                height: MediaQuery.of(context).size.height /2.5 ,
               
                child: ListView.builder(
                    itemCount: listOfAccountData!.data.accounts.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin:const EdgeInsets.all(8),
                        child: Column(
                            children: [
                              RichTextWidget(firstText: " Account No : ", secondText: listOfAccountData!.data.accounts[index].accountNo),
                             
                              RichTextWidget(firstText: " Amount OverDue : ", secondText: listOfAccountData!.data.accounts[index].amountOverdue),
                             
                              RichTextWidget(firstText: " Balance : ", secondText: listOfAccountData!.data.accounts[index].currentBalance),
                              
                              RichTextWidget(firstText: " Sanctioned Rs : ", secondText: listOfAccountData!.data.accounts[index].sanctionAmount),
                              
                              RichTextWidget(firstText: " Account opened date : ", secondText: listOfAccountData!.data.accounts[index].dateOpened),
                              
                              RichTextWidget(firstText: " Reported Date : ", secondText: listOfAccountData!.data.accounts[index].dateReported),
                              
                                RichTextWidget(firstText: " Lender : ", secondText: listOfAccountData!.data.accounts[index].lender),
            
                               
                               // Text("Lender:${listOfAccountData!.data.accounts[index].lender}"),
                              ]),
                      );
                    })),
              ),
            ),
          ],
        )
        : const Center(child: Text('Loading... \nPlease wait',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),));
  }

  Future<void> getAccountListdata() async {
    try {
      var accounturl = "https://dhanlap.com/api/sample_credit_report";

      var uri = Uri.parse(accounturl);
      var response = await http.get(uri);
      setState(() {
        listOfAccountData =
            ListOfAccountData.fromJson(jsonDecode(response.body));
      });
    } catch (e) {
      print(e);
    }
  }
}
