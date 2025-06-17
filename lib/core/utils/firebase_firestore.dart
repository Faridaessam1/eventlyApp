import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:evently_app/models/event_data_model.dart';

abstract class FireBaseFirestoreServices {
  // Get current user ID
  static String? get currentUserId => FirebaseAuth.instance.currentUser?.uid;

  // Function to get collection reference for current user
  static CollectionReference<EventDataModel> getCollectionRef() {
    if (currentUserId == null) {
      throw Exception("User not authenticated");
    }

    // Create path: users/{userId}/events
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId!)
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
      fromFirestore: (snapshot, _) =>
          EventDataModel.fromFirestore(snapshot.data()!),
      toFirestore: (eventModel, _) => eventModel.toFireStore(),
    );
  }

  // Function to create new event for current user
  static Future<bool> createNewEvent(EventDataModel eventData) async {
    try {
      if (currentUserId == null) {
        throw Exception("User not authenticated");
      }

      var collectionRef = getCollectionRef();
      var docRef = collectionRef.doc(); // Create new doc in collection

      eventData.eventID = docRef.id;
      // Add user ID to event data
      eventData.userId = currentUserId!;

      await docRef.set(eventData); // Use await here
      return true;
    } catch (error) {
      print("Error creating event: $error");
      return false;
    }
  }

  // Function to get data from firestore for current user
  static Future<List<EventDataModel>> getDataFromFirestore(String categoryName) async {
    try {
      if (currentUserId == null) {
        throw Exception("User not authenticated");
      }

      Query<EventDataModel> collectionRef = getCollectionRef();

      if (categoryName != "All") {
        collectionRef = collectionRef.where(
          "eventCategory",
          isEqualTo: categoryName,
        );
      }

      QuerySnapshot<EventDataModel> data = await collectionRef.get();

      List<EventDataModel> eventDataList = data.docs.map(
            (element) => element.data(),
      ).toList();

      return eventDataList;
    } catch (error) {
      print("Error getting data: $error");
      return [];
    }
  }

  // Function to get stream data for current user
  static Stream<QuerySnapshot<EventDataModel>> getStreamData(String categoryName) {
    if (currentUserId == null) {
      // Return empty stream if user not authenticated
      return Stream.empty();
    }

    Query<EventDataModel> collectionRef = getCollectionRef();

    if (categoryName != "All") {
      collectionRef = collectionRef.where(
        "eventCategory",
        isEqualTo: categoryName,
      );
    }

    return collectionRef.snapshots();
  }

  // Function to get stream favorite data for current user
  static Stream<QuerySnapshot<EventDataModel>> getStreamFavoriteData() {
    if (currentUserId == null) {
      return Stream.empty();
    }

    var collectionRef = getCollectionRef().where(
      "isFavorite",
      isEqualTo: true,
    );

    return collectionRef.snapshots();
  }

  // Function to delete event for current user
  static Future<bool> deleteEvent(EventDataModel data) async {
    try {
      if (currentUserId == null) {
        throw Exception("User not authenticated");
      }

      var collectionRef = getCollectionRef();
      var docRef = collectionRef.doc(data.eventID);

      await docRef.delete(); // Use await here
      return true;
    } catch (error) {
      print("Error deleting event: $error");
      return false;
    }
  }

  // Function to update event for current user
  static Future<bool> updateEvent(EventDataModel data) async {
    try {
      if (currentUserId == null) {
        throw Exception("User not authenticated");
      }

      var collectionRef = getCollectionRef();
      var docRef = collectionRef.doc(data.eventID);

      await docRef.update(data.toFireStore()); // Use await here
      return true;
    } catch (error) {
      print("Error updating event: $error");
      return false;
    }
  }

  static Future<DocumentSnapshot> getUserData(String userId) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();
  }
}