import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_data_model.dart';

class FireBaseFirestore{
// function 3shan tt3aml m3 firestore
  static CollectionReference<EventDataModel> getCollectionRef() {
    //singelton class bakhod mno object w a3del 3aleh
    // b set esm el collection (table) ,
    // w byrg3le el collection kolo bkol el docs el feh,
    // do converter
    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
          //snapshot da el doc el gy mn firesotre(map<string , dynamic >) btakhdo w thawelo l object mn no3 eventDataModel
          // from firestore 3ndha parameter map string w dynamic
          // badeha el snapshot.data 3shan el parameter
          fromFirestore: (snapshot, _) =>
              EventDataModel.fromFirestore(snapshot.data()!),
          toFirestore: (eventModel, _) => eventModel.toFireStore(),
        ); // bstkhdmha 3shan a read w write data
  }

  // function t create new event
  static Future<bool> createNewEvent(EventDataModel eventData) async {
    try{
      //awl haga a3mlha eni ageb el collection ref
      var collectionRef = getCollectionRef();

      var docRef = collectionRef.doc(); //create new doc in collection

      eventData.eventID = docRef.id;
      //b2olo yhotele el value bt3t el id fl object mn l id el hwa auto generated fe el firestore


       docRef.set(eventData);
      //b2olo y create el data bl object el m3aia mn eventDataModel
      // yroh yb3to l function to firestore w thawelo l map w tb3to
      // mesh 7ata await hna 3shan ana msh mestnya data trg3 lw kan fe haga rg3a kan lazm await

      return Future.value(true);
    } catch(error){
      return Future.value(false);
    }




  }
}