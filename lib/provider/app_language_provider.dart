import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier{
  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('en') ;
    if(savedLanguage!=null){
      applanguage=savedLanguage;
    }
    notifyListeners();
  }

   String applanguage='en';
   Future<void> changeLanguage(String newLanguage)async{
     if(applanguage==newLanguage){
       return;
     }

     applanguage=newLanguage;

     SharedPreferences prefs=await SharedPreferences.getInstance();
     prefs.setString('en', newLanguage);
     notifyListeners();
   }

}