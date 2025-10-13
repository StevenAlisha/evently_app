import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_language_provider.dart';
import '../utls/appcolors.dart';

class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({super.key});

  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
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
                    languageProvider.changeLanguage('en');

                  },
                  child:  languageProvider.applanguage=='en'?
                  getSelectedIdex(language: AppLocalizations.of(context)!.english):
                  getUnSelectedIdex(language: AppLocalizations.of(context)!.english)


          ),



              GestureDetector(
                onTap: (){
                  //todo: change langage to ar
                  languageProvider.changeLanguage('ar');

                },
                child:  languageProvider.applanguage=='ar'?
                    getSelectedIdex(language: AppLocalizations.of(context)!.arabic):
                    getUnSelectedIdex(language: AppLocalizations.of(context)!.arabic)



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
