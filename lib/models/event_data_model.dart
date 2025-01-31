import 'package:flutter/foundation.dart';

class EventDataModel{
  static String collectionName = "EventDataCollection";
  String eventID;
  String eventTitle;
  String eventDescription;
  String eventImage;
  String eventCategory;
  DateTime eventDate;
  bool isFavorite;

  EventDataModel({
     this.eventID="",
    required this.eventTitle,
    required this.eventDescription,
    required this.eventImage,
    required this.eventCategory,
    required this.eventDate,
    this.isFavorite = false,
  });

  factory EventDataModel.fromFirestore (Map<String , dynamic> jason) => EventDataModel(
      eventID: jason["eventID"],  //akne 3nde list w bgeb mnha values bl index de map bngeb el values bl key f b2ol esm el map of el key
      eventTitle: jason["eventTitle"],
      eventDescription: jason["eventDescription"],
      eventImage: jason["eventImage"],
      eventCategory: jason["eventCategory"],
      eventDate: DateTime.fromMillisecondsSinceEpoch(jason["eventDate"]),
      isFavorite: jason["isFavorite"],
    ); //da named constructor w named constructor hwa special type of function malosh return type
  // 3shan kda 3amlna factory 3shan tkhle fe return type


  ///Function to convert object to jason format the only lang that server understand
  Map<String , dynamic> toFireStore(){
    return {
      "eventID" : eventID,
      "eventTitle" : eventTitle,
      "eventDescription" : eventDescription,
      "eventImage" : eventImage,
      "eventCategory" : eventCategory,
      "eventDate" : eventDate.millisecondsSinceEpoch,
      "isFavorite" : isFavorite,
    };
  }

  /// Function to convert jason format to object to read data from server the only lang compiler flutter understand
// EventDataModel fromFirestore(Map<String , dynamic> jason){ //function btakhod jason w trg3 object
//   return EventDataModel(
//       eventID: jason["eventID"],  //akne 3nde list w bgeb mnha values bl index de map bngeb el values bl key f b2ol esm el map of el key
//       eventTitle: jason["eventTitle"],
//       eventDescription: jason["eventDescription"],
//       eventImage: jason["eventImage"],
//       eventCategory: jason["eventCategory"],
//       eventDate: jason["eventDate"],
//       isFavorite: jason["isFavorite"],
//   );
// } momkn tb2a function aw named constructor


}