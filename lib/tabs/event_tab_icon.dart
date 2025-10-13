import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class EventTabIcon extends StatelessWidget {
    EventTabIcon({

      super.key,required this.isSelected,
      required this.eventName
      ,required this.selectedbg,
      required this.textStyle,
      required this.unSelectedtextStyle,
      required this.unSelectedbg,
      this.hasIcon=false,
     this.image='',
      required this.bordercolor,
    });
bool isSelected;
TextStyle unSelectedtextStyle;
TextStyle textStyle;
String eventName;
Color selectedbg;
Color unSelectedbg;
Color bordercolor;
String image;
bool hasIcon;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.02,
      vertical: height*0.006),
      margin: EdgeInsets.symmetric(horizontal: width*0.01,vertical: height*0.001),
      child: hasIcon?
      Row(
        children: [
         Image.asset(image),
          Text(
            eventName,
            style: isSelected?
            textStyle:
             unSelectedtextStyle,),

        ],
      ):  Row(
        children: [

          Text(
            eventName,
            style: isSelected?
            textStyle:
            unSelectedtextStyle,),

        ],
      ),
      decoration: BoxDecoration(
         border: Border.all(color:  bordercolor,width: 2),
          color:
          isSelected? selectedbg:
            unSelectedbg,
          borderRadius: BorderRadius.circular(46)),) ;
  }
}
