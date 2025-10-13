import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_language_provider.dart';
import '../provider/app_theme_provider.dart';
import '../utls/appcolors.dart';

class ThemeButtomSheet extends StatefulWidget {
  const ThemeButtomSheet({super.key});

  @override
  State<ThemeButtomSheet> createState() => _ThemeButtomSheetState();
}

class _ThemeButtomSheetState extends State<ThemeButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Padding(
      padding:   EdgeInsets.symmetric(
          horizontal:height*0.03,
             vertical: height*0.03
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

              GestureDetector(
                  onTap: (){
                    //todo: change langage to ar
                    themeProvider.changeTheme(ThemeMode.dark);

                  },
                  child:  themeProvider.isDarkMode()?
                  getSelectedIdex(language: AppLocalizations.of(context)!.dark):
                  getUnSelectedIdex(language: AppLocalizations.of(context)!.dark)


          ),



              GestureDetector(
                onTap: (){
                  //todo: change langage to ar
                  themeProvider.changeTheme(ThemeMode.light);

                },
                child: ! themeProvider.isDarkMode()?
                    getSelectedIdex(language: AppLocalizations.of(context)!.light):
                    getUnSelectedIdex(language: AppLocalizations.of(context)!.light)



          ),
      ],),
    );

  }

  Widget getSelectedIdex({required String language}){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
           language,
          style: AppStyles.bold20blue,),
        Icon(Icons.check,color: AppColors.Primarycolorlight,size: 35,),
      ],
    );
  }
  Widget getUnSelectedIdex({required String language}){
    return  Text(
    language,
      style: AppStyles.medium16black,);
  }

}
