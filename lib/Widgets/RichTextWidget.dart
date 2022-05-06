


import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {


   final  String firstText;
   final  String secondText;

  const RichTextWidget({ Key? key , required this.firstText, required this.secondText }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.grey[100],
      child: RichText(
         text: TextSpan(children:[
    
           TextSpan(text: firstText,style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600)),
    
           TextSpan(text: secondText,style:const  TextStyle(color: Colors.black87,fontSize: 15,fontWeight: FontWeight.w400))
    
         ] ),
          ),
    );
      }
      
    
  }
