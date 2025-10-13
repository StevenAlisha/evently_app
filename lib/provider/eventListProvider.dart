import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../model/eventmodel.dart';
import '../utls/frebase_utls.dart';

class EventListProvider extends ChangeNotifier{
  List<Event>eventList=[];
  List<Event>filterEventList=[];
  List<String>eventsNameList = [
  ];
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
  void getAllEvents()async {
    QuerySnapshot<Event> snapshot= await FirebaseUtls.getEventCollection().where(
        'event_name',isEqualTo: eventsNameList[selectedIndex]).orderBy('event_date').get();
    eventList=  snapshot.docs.map((doc)  {
      return doc.data();
    } ,).toList();
    filterEventList=eventList;
         notifyListeners();
  }

  void getFilterEventList()async{
    var querySnapshot= await FirebaseUtls.getEventCollection().where(
        'event_name',isEqualTo: eventsNameList[selectedIndex]).get();
    querySnapshot.docs.map((doc){
      return doc.data();
    }
    ).toList();
    notifyListeners();

  }

  void getFilterEventFromFirestore()async{
    var querySnapshot=await FirebaseUtls.getEventCollection().where(
        'event_name',isEqualTo: eventsNameList[selectedIndex]).orderBy('event_date').get();
    filterEventList= querySnapshot.docs.map((docs) {
      return docs.data();
    },).toList();
    notifyListeners();
  }

 void changeSelectedIndex(int newSelectedIndex){
    selectedIndex=newSelectedIndex;
    selectedIndex==0?getAllEvents():getFilterEventList();
    notifyListeners();

 }



}