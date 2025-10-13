 import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/eventmodel.dart';

class FirebaseUtls{
 static CollectionReference<Event> getEventCollection(){
  return FirebaseFirestore.instance.collection(Event.collectionName).withConverter<Event>(
        fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!),
        toFirestore: (event, options) => event.toFireStore(),
    );
  }
  static Future<void> addEventCollection (Event event){
    //todo 1- create collection in firestore
   var collection=getEventCollection();
    //todo 1- create document
   var docRef= collection.doc();
   event.id = docRef.id;
 return   docRef.set(event);

 }

 }