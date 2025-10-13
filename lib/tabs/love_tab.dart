import 'package:evently_app/widgets/customtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../utls/App_Styles.dart';
import '../utls/appcolors.dart';
import '../utls/appimages.dart';

class LoveTab extends StatelessWidget {
    LoveTab({super.key});
    var favoriteController=TextEditingController();
  List<String>images=[
    AppAssets.birthdayim,
    AppAssets.book_clubim,
    AppAssets.eatingim,
    AppAssets.exhibitionim,
    AppAssets.book_clubim,
    AppAssets.gamingim,
    AppAssets.meetingim,
    AppAssets.holidayim,
    AppAssets.workshopim,

  ];
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return     SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Customtextfield(
              controller: favoriteController,
              prefixiconcolor: AppColors.Primarycolorlight,
             prefixicon: Icon(Icons.search_rounded),
              hintText: 'Search For Event',
              borderSideColor: AppColors.Primarycolorlight,
            hintstyle: AppStyles.bold14primary,
            ),




            Expanded(child: ListView.separated(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(

                  children: [
                    Container(
                      height: height*0.250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(image: AssetImage(images[index]))),),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
                      padding: EdgeInsets.symmetric(horizontal:  width*0.022 ),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.Primarycolorlight,width: 2),
                          color: AppColors.white,borderRadius:BorderRadius.circular(8)),
                      child:Column(
                        children: [
                          Text('22',style: AppStyles.bold20blue,),
                          Text('NOV',style: AppStyles.bold14primary,),
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

                          Text('This is birthday',style: AppStyles.bold20black,),
                          Spacer(),
                          Image.asset(AppAssets.iconlove)
                        ],

                      )
                      ,),
                  ],
                ),
              );
            }, separatorBuilder: (context, index) {
              return SizedBox(height: height*0.01,);
            },itemCount: images.length)),
          ],
        ),
      ),
    )
    ;
  }
}
