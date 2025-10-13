import 'package:evently_app/utls/App_Styles.dart';
import 'package:flutter/material.dart';

class EventData extends StatelessWidget {
    EventData({super.key,required this.image,required this.text1,required this.text2,
    required this.onTap});
String image;
String text1;
String text2;
VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return InkWell(
      onTap:onTap ,
      child: Row(children: [
        Image.asset(image),
        SizedBox(width: width*0.02,),
        Text(text1,style: Theme.of(context).textTheme.  bodySmall,),
        Spacer(),
        Text(text2,style: AppStyles.med16primary,)
      ],),
    );
  }
}
