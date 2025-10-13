import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../provider/app_language_provider.dart';
import '../provider/app_theme_provider.dart';
import '../utls/App_Styles.dart';
import '../utls/appcolors.dart';
import '../utls/appimages.dart';
import '../utls/approute.dart';
import '../widgets/language_buttom_sheet.dart';
import '../widgets/theme_button Sheet.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});



  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var appLanguage=Provider.of<AppLanguageProvider>(context);
    var appTheme=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.Primarycolorlight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Image.asset(AppAssets.rout,height: height*0.17,width: width*0.5,),
            Expanded(
              child: Column(children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  'Steven Alisha',style: AppStyles.medium20white,),
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  'stevenalisha@gmail.com',style: AppStyles.medium16black,),

              ],),
            )
          ],),
        toolbarHeight: height*0.3,
      ),
      body: Padding(
        padding:   EdgeInsets.symmetric(
            horizontal: height*0.01,
            vertical: height*0.02

        ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.language,
                style:Theme.of(context).textTheme.headlineLarge),
            GestureDetector(
              onTap: (){
                showLanguageBottomSheet(context);
              },
              child: Container(
                margin: EdgeInsets.all(height*0.01),
                padding: EdgeInsets.symmetric(
                    vertical: height*0.01,
                    horizontal: height*0.01

                ),

                decoration: BoxDecoration(
                    border:  Border.all(
                        width: 2,
                        color: AppColors.Primarycolorlight

                    ),
                    borderRadius: BorderRadius.circular(16)

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(appLanguage.applanguage=='en'?
                    AppLocalizations.of(context)!.english:
                    AppLocalizations.of(context)!.arabic
                      ,style: AppStyles.bold20blue,),
                    Icon(Icons.arrow_drop_down_outlined,color: AppColors.Primarycolorlight,size: 35,)
                  ],),
              ),
            ),
            SizedBox(height: height*0.01,),
            Text( AppLocalizations.of(context)!.theme,style: AppStyles.bold20black,),
            GestureDetector(
              onTap:  (){
                themeSheet(context);
              },
              child: Container(
                margin: EdgeInsets.all(height*0.01),
                padding: EdgeInsets.symmetric(
                    vertical: height*0.01,
                    horizontal: height*0.01

                ),

                decoration: BoxDecoration(
                    border:  Border.all(
                        width: 2,
                        color: AppColors.Primarycolorlight

                    ),
                    borderRadius: BorderRadius.circular(16)

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      appTheme.isDarkMode()?
                      AppLocalizations.of(context)!.dark:
                      AppLocalizations.of(context)!.light
                      ,style: AppStyles.bold20blue,),
                    Icon(Icons.arrow_drop_down_outlined,color: AppColors.Primarycolorlight,size: 35,)
                  ],),
              ),
            ),
            Spacer(),
            ElevatedButton(

                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
                    backgroundColor: Colors.red),
                onPressed: (){
                  Navigator.of(context).pushNamed(Approuts.loginscreen);

                }, child:Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: width*0.02,),
                Text(AppLocalizations.of(context)!.logout,style: AppStyles.bold20black ,),


              ],
            ) ),
            SizedBox(height: height*0.02,)
          ],


        ),
      ),

    );
  }
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder:(context) => LanguageButtomSheet(),

    );
  }

  void themeSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder:(context) => ThemeButtomSheet());
  }
}
