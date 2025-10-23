import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/provider/app_theme_provider.dart';
import 'package:evently_app/widgets/customelevatedbuttom.dart';
import 'package:evently_app/widgets/toggle.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class logoutScreen extends StatefulWidget {
    logoutScreen({super.key});

  @override
  State<logoutScreen> createState() => _logoutScreenState();
}

class _logoutScreenState extends State<logoutScreen> {
  String current = 'EG';

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var appLanguage=Provider.of<AppLanguageProvider>(context);
    var appTheme=Provider.of<AppThemeProvider>(context);
    return Scaffold(
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

       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
           Image(image: AssetImage(AppAssets.firstimage)),
           SizedBox(height: height*0.02,),
           Text(
             'Personalize Your Experience',style: AppStyles.bold20blue,),
             SizedBox(height: height*0.02,),
             Text(
               'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',style: Theme.of(context).textTheme.displayLarge,),
             SizedBox(height: height*0.02,),

             Row(children: [Text(AppLocalizations.of(context)!.language,style: AppStyles.bold20blue,),
               Spacer(),
               FlagToggleExample(im2: AppAssets.EG,im1: AppAssets.US,)
             ],

             ),
             SizedBox(height: height*0.02,),
             Row(children: [
               Text(AppLocalizations.of(context)!.theme,style: AppStyles.bold20blue,),

               Spacer(),
               AnimatedToggleSwitch<String>.dual(
               current: current,
               first: 'EG',
               second: 'US',
               indicatorAnimationType: AnimationType.onHover,
               indicatorSize:   Size.fromWidth(20),
               height: 40,
               iconBuilder: (value) {
               return Padding(
               padding: const EdgeInsets.all(1.0),
               child: Image.asset(
               value == 'EG'
               ?   AppAssets.sun:
               AppAssets.moon,
               fit: BoxFit.fill,
               height: double.infinity,
               width: double.infinity,
               ),
               );
               },
               onChanged: (v) {

                 if(appTheme.appTheme==ThemeMode.dark){
                   appTheme.changeTheme(ThemeMode.light);
                 }
                 else    if(appTheme.appTheme==ThemeMode.light){
                   appTheme.changeTheme(ThemeMode.dark);
                 }
                 setState(() => current = v);},
               ),
             ],
             ),


             SizedBox(height: height*0.02,),
             Customelevatedbuttom(
               onPressed: (){Navigator.of(context).pushNamed(Approuts.intro_screen);},elevatedcolor: AppColors.Primarycolorlight,elevatedchild: Text('Lets Start',style: AppStyles.medium20white,),)
         ],),
       ),
    );
  }
}
