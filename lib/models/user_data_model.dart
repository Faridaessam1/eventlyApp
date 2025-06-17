class UserModel {
  String id;
  String name;
  String email;
  List<String>? eventIds; // IDs of events created by this user

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.eventIds,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'eventIds': eventIds ?? [],
    };
  }

  // Create from Map (Firestore document)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      eventIds: List<String>.from(map['eventIds'] ?? []),
    );
  }
}