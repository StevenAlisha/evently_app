import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/eventmodel.dart';
import '../utls/App_Styles.dart';

import '../utls/appcolors.dart';
import '../utls/appimages.dart';

class Eventitem extends StatelessWidget {
  Event event;
    Eventitem({super.key,required this.event});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Stack(

      children: [
        Container(
          height: height*0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: AssetImage(event.eventImage))),),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
          padding: EdgeInsets.symmetric(horizontal:  width*0.022 ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.Primarycolorlight,width: 2),
              color: AppColors.white,borderRadius:BorderRadius.circular(8)),
          child:Column(
            children: [
              Text(  event.eventDate.day.toString(),style: AppStyles.bold20blue,),
              Text(DateFormat('MMM').format(event.eventDate),style: AppStyles.bold14primary,),
            ],
          )
          ,),
        Container(
          margin:   EdgeInsets.only(top: height*0.19,left: width*0.01,right: width*0.01),
          padding: EdgeInsets.symmetric(horizontal: width*0.01),
          height: height*0.04,
          decoration: BoxDecoration(

              color: AppColors.white,borderRadius:BorderRadius.circular(8)),
          child:Row(

            children: [

              Text(event.title,style: AppStyles.bold20black,),
              Spacer(),
              Image.asset(AppAssets.iconlove)
            ],

          )
          ,),
      ],
    );
  }}