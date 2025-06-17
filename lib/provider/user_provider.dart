import 'package:flutter/material.dart';
import 'package:evently_app/core/utils/firebase_auth.dart';

import '../models/user_data_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  // Load current user data
  Future<void> loadCurrentUser() async {
    _isLoading = true;
    notifyListeners();

    _currentUser = await FirebaseFunctions.getCurrentUserData();

    _isLoading = false;
    notifyListeners();
  }

  // Update user data
  Future<bool> updateUser(UserModel user) async {
    bool success = await FirebaseFunctions.updateUserData(user);
    if (success) {
      _currentUser = user;
      notifyListeners();
    }
    return success;
  }

  // Add event ID to user's events
  Future<bool> addEventToUser(String eventId) async {
    if (_currentUser == null) return false;

    List<String> updatedEvents = List.from(_currentUser!.eventIds ?? []);
    updatedEvents.add(eventId);

    UserModel updatedUser = UserModel(
      id: _currentUser!.id,
      name: _currentUser!.name,
      email: _currentUser!.email,
      eventIds: updatedEvents,
    );

    return await updateUser(updatedUser);
  }

  // Remove event ID from user's events
  Future<bool> removeEventFromUser(String eventId) async {
    if (_currentUser == null) return false;

    List<String> updatedEvents = List.from(_currentUser!.eventIds ?? []);
    updatedEvents.remove(eventId);

    UserModel updatedUser = UserModel(
      id: _currentUser!.id,
      name: _currentUser!.name,
      email: _currentUser!.email,
      eventIds: updatedEvents,
    );

    return await updateUser(updatedUser);
  }

  // Clear user data (for logout)
  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }
}