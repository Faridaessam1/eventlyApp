import 'package:cloud_firestore/cloud_firestore.dart';

class EventDataModel {
  static const String collectionName = "events";

  String? eventID;
  String? userId; // Add this field
  String eventTitle;
  String eventDescription;
  String eventImage;
  String eventCategory;
  DateTime eventDate;
  bool isFavorite;
  String? eventLocation; // Optional location field

  EventDataModel({
    this.eventID,
    this.userId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventImage,
    required this.eventCategory,
    required this.eventDate,
    this.isFavorite = false,
    this.eventLocation,
  });

  // Convert from Firestore document to EventDataModel
  EventDataModel.fromFirestore(Map<String, dynamic> data)
      : eventID = data['eventID'],
        userId = data['userId'],
        eventTitle = data['eventTitle'] ?? '',
        eventDescription = data['eventDescription'] ?? '',
        eventImage = data['eventImage'] ?? '',
        eventCategory = data['eventCategory'] ?? '',
        eventDate = (data['eventDate'] as Timestamp).toDate(),
        isFavorite = data['isFavorite'] ?? false,
        eventLocation = data['eventLocation'];

  // Convert EventDataModel to Map for Firestore
  Map<String, dynamic> toFireStore() {
    return {
      'eventID': eventID,
      'userId': userId,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'eventImage': eventImage,
      'eventCategory': eventCategory,
      'eventDate': eventDate,
      'isFavorite': isFavorite,
      'eventLocation': eventLocation,
    };
  }
}