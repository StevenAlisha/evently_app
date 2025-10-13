import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_theme_provider.dart';
import 'package:evently_app/tabs/hometab.dart';
import 'package:evently_app/tabs/love_tab.dart';
import 'package:evently_app/tabs/map_tab.dart';
import 'package:evently_app/tabs/profiletab.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/approute.dart';
import 'package:evently_app/utls/appthem.dart';
import 'package:evently_app/widgets/theme_button%20Sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/app_language_provider.dart';
import 'widgets/language_buttom_sheet.dart';

class HomePage extends StatefulWidget {
     HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {

    List<Widget>Tabs=[
      Hometab(),
      MapTab(),
      LoveTab(),
      ProfileTab(),];
    return Scaffold(
      body: Tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedIndex,
          onTap: (index){
          selectedIndex=index;
          setState(() {

          });
          },

          items: [
            buildButtomNavigationBar(selectedImage: AppAssets.Home_out, label: "Home", unSelectedImage: AppAssets.Home_in, index: 0),
            buildButtomNavigationBar(selectedImage: AppAssets.map_out, label: "Map", unSelectedImage: AppAssets.map_in, index: 1),
            buildButtomNavigationBar(selectedImage: AppAssets.love_out, label: "Love", unSelectedImage: AppAssets. love_in, index: 2),
            buildButtomNavigationBar(selectedImage: AppAssets.profile_out, label: "Profile", unSelectedImage: AppAssets.profile_in, index: 3)


          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

          child: Icon(Icons.add,size: 35, ),
          onPressed: (){
        Navigator.of(context).pushNamed(Approuts.addevent);
          }),

    );
  }



   BottomNavigationBarItem buildButtomNavigationBar({
     required String selectedImage,required String label,required String unSelectedImage,required int index

   }){
   return BottomNavigationBarItem(icon:index==selectedIndex?
   ImageIcon( AssetImage( unSelectedImage)):
   ImageIcon( AssetImage(selectedImage)),label: label);
  }
}
