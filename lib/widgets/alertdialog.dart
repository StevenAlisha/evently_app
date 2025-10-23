import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:flutter/material.dart';

class DialogWidget{
 static void showLoading({required BuildContext context,required String message}){
    showDialog(
     barrierDismissible: false,
      context: context, builder:(context) {
      return AlertDialog(content: Row(children: [
        CircularProgressIndicator(color: AppColors.grey,),
        Text(message,style: AppStyles.medium16black,)
      ],),);
    }, );
}
  static void hideLoading({required BuildContext context}){
   Navigator.pop(context);
  }
  static void showMessage({required BuildContext context,required String message,String titleMessage='',String confirmMessage='',String cancelMessage=''}){
   showDialog(context: context, builder: (context) {
      return AlertDialog(
        title:Text(titleMessage,style: AppStyles.bold20black,),
        content:Text(message,style: AppStyles.medium16black,),
        actions:[TextButton(onPressed: (){    Navigator.pushNamedAndRemoveUntil(
          context, Approuts.homepage, (route) => false,);},child: Text(confirmMessage)),
          TextButton(onPressed: () {
            Navigator.pop(context);
          },child: Text(cancelMessage))
        ],
      );
   },);
  }
}