import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/eventListProvider.dart';
import 'package:evently_app/tabs/event_tab_icon.dart';
import 'package:evently_app/utls/App_Styles.dart';
import 'package:evently_app/utls/appcolors.dart';
import 'package:evently_app/utls/appimages.dart';
import 'package:evently_app/utls/frebase_utls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/eventmodel.dart';
import '../widgets/eventItem.dart';



class Hometab extends StatefulWidget {

    Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}
 late EventListProvider eventListProvider;
class _HometabState extends State<Hometab> {

@override
  void initState(){
 super.initState();
 WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

   eventListProvider.getAllEvents();

 },);
}
@override

  @override
  Widget build(BuildContext context) {

     eventListProvider= Provider.of<EventListProvider>(context);
   eventListProvider.getAllEvents();
     eventListProvider.getEventListName(context);

 var height=MediaQuery.of(context).size.height;
 var width=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Welcome Back',style: AppStyles.regular14white,),
              Text('Steven Alisha',style: AppStyles.bold24white,),
            ],
            ),
            Row(
              children: [
                Image.asset(AppAssets.sun, ),
                SizedBox(width: width*0.01,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width*0.02
                  ,vertical: height*0.004),
                  margin: EdgeInsets.only(left: 4),
                   decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(8)),
                  child: Text('EN',style:TextStyle(
                      color: Theme.of(context).primaryColor),),
                )
              ],
            )
          ],
        ),
      ),
    body: Column(
  children: [
    Container(
      height: height*0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24)),
            color: Theme.of(context).primaryColor),
      child: Padding(
        padding:   EdgeInsets.only(left:height*0.03,top: height*0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Image.asset(AppAssets.map_out),
              SizedBox(width: width*0.01,),
              Text('Cairo , Egypt',style: AppStyles.regular14white,)
            ],),
            DefaultTabController(
              length: eventListProvider. eventsNameList.length,
              child: TabBar(
                  onTap: (index){
                eventListProvider.changeSelectedIndex(index);

                    },
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorColor: AppColors.transparent,
                  dividerColor: AppColors.transparent,
                  labelPadding: EdgeInsets.zero,
                  tabs: eventListProvider.eventsNameList.map((eventName)=>EventTabIcon(
                    bordercolor: Theme.of(context ).focusColor,
                    unSelectedbg:  AppColors.transparent,
                    unSelectedtextStyle: AppStyles.med16white,
                    textStyle: Theme.of(context).textTheme.headlineMedium!,
                    selectedbg: Theme.of(context).focusColor,
                      isSelected:eventListProvider.selectedIndex==eventListProvider.eventsNameList.indexOf(eventName)?true:false,
                      eventName: eventName)
                  ).toList()

              ),
            )
          ],
        ),
      ),
    ),
    SizedBox(height: height*0.01,),
    Expanded(
        child:eventListProvider.filterEventList.isEmpty?Center(child: Text('No Events',style: AppStyles.medium16black,),)
        :

        ListView.separated(itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Eventitem(event:eventListProvider.filterEventList[index]),
      );
    }, separatorBuilder: (context, index) {
      return SizedBox(height: height*0.01,);
  },itemCount: eventListProvider.filterEventList.length))


],),

    );
  }

}
