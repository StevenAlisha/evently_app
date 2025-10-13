import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntrodctionScreen extends StatelessWidget {
  const IntrodctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppAssets.appbar)),
            Text('Evently',style: AppStyles.bold36blue,)
          ],
        ),),
      body: IntroductionScreen(
scrollPhysics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        back: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back,color: AppColors.Primarycolorlight,)),

        backSemantic: 'back',
        next: CircleAvatar(
          backgroundColor: Colors.white,
            child: Icon(Icons.arrow_forward_outlined,color: AppColors.Primarycolorlight,)),
        showBackButton: true,
        showFirstBackButton: true,
        skip: Text('data', style: AppStyles.medium20white),
        done: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_forward_outlined,color: AppColors.Primarycolorlight,)),
        onDone: () {
          Navigator.pushNamed(context, Approuts.loginscreen);
        },
        onSkip: () {},

        pages: [
      PageViewModel(
bodyWidget: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Image(image: AssetImage(AppAssets.find)),
  SizedBox(height: height*0.03,),
  Text('Find Events That Inspire You',style: AppStyles.bold20blue,),
    SizedBox(height: height*0.03,),
    Text(
        "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
      style: Theme.of(context).textTheme.displayLarge,
    )
],),


        title: ''
      ),
          PageViewModel(
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage(AppAssets.connect)),
                  SizedBox(height: height*0.03,),
                  Text('Effortless Event Planning',style: AppStyles.bold20blue,),
                  SizedBox(height: height*0.03,),
                  Text(
                    "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
                    style: Theme.of(context).textTheme.displayLarge,
                  )
                ],),
              title: ''
          ),

          PageViewModel(
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage(AppAssets.connect)),
                  SizedBox(height: height*0.03,),
                  Text('Connect with Friends & Share Moments',style: AppStyles.bold20blue,),
                  SizedBox(height: height*0.03,),
                  Text(
                    "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
                    style: Theme.of(context).textTheme.displayLarge,
                  )
                ],),
              title: ''
          ),


        ]

      ),
    );
  }
}
