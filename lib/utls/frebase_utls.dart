 import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/eventmodel.dart';
import '../model/usersModel.dart';

class FirebaseUtls{
 static CollectionReference<Event> getEventCollection(String uID){
  return getUserCollection().doc(uID).collection(Event.collectionName).withConverter<Event>(
        fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!),
        toFirestore: (event, options) => event.toFireStore(),
    );
  }
  static Future<void> addEventCollection (Event event,String uID){
    //todo 1- create collection in firestore
   var collection=getEventCollection(uID );
    //todo 1- create document
   var docRef= collection.doc();
   event.id = docRef.id;
 return   docRef.set(event);

 }
 static CollectionReference<MyUser> getUserCollection(){
   return FirebaseFirestore.instance.collection(MyUser.collectionName).withConverter(
     fromFirestore: (snapshot, options)=>MyUser.fromFireStore(snapshot.data()!),
     toFirestore: (user, options) => user.toFireStore(), );
 }
 static Future<void> addUserToFireStore(MyUser myuser){
  return getUserCollection().doc(myuser.id).set(myuser);

 }
 static Future<MyUser?> readUserFromFirebase(String id)async {
  var querysnapshot=await getUserCollection().doc(id).get();
 return querysnapshot.data();
 }
 }