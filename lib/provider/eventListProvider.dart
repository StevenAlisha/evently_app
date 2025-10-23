import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/usersModel.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../model/eventmodel.dart';
import '../utls/frebase_utls.dart';
import '../widgets/toastWidgets.dart';

class EventListProvider extends ChangeNotifier{
  List<Event>eventList=[];
  List<Event>filterEventList=[];
  List<String>eventsNameList = [
  ];
  List<Event>favoriteList=[];
  int selectedIndex=0;
  List<String>getEventListName(BuildContext context){
    return eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context )!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.boolclub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.sport,

    ];

  }


  void getAllEvents(String uID)async {
    QuerySnapshot<Event> snapshot= await FirebaseUtls.getEventCollection(uID).orderBy('event_date').get();
    eventList=  snapshot.docs.map((doc)  {
      return doc.data();
    } ,).toList();
    filterEventList=eventList;
         notifyListeners();
  }

  void getFilterEventList(String uID)async{
    var querySnapshot= await FirebaseUtls.getEventCollection(uID).where(
        'event_name',isEqualTo: eventsNameList[selectedIndex]).get();
    filterEventList=querySnapshot.docs.map((doc){
      return doc.data();
    }
    ).toList();
    notifyListeners();

  }

 void changeSelectedIndex(int newSelectedIndex,String uID) {
    selectedIndex=newSelectedIndex;
      selectedIndex==0? getAllEvents(uID):getFilterEventList(uID);
notifyListeners();
 }
 
 void updateIsFavorite(Event event,String uID){
    FirebaseUtls.getEventCollection(uID).doc(event.id).update({'is_favorite':!event.isFavorite}).then((value) =>  ToastWidget.shoeToastMsg(message: 'done'));
    selectedIndex==0? getAllEvents(uID):getFilterEventList(uID);
    getFavoriteEvent(uID);
    notifyListeners();
 }
 void getFavoriteEvent(String uID)async{
   var querySnapshot=await FirebaseUtls.getEventCollection(uID).get();
   eventList=querySnapshot.docs.map((doc){
     return doc.data();
   }).toList();
   favoriteList=eventList.where((event){
    return event.isFavorite==true;
   }).toList();
   notifyListeners();
 }





}