import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  String _username = "admin";  // Username default
  String _password = "adel123";  // Password default
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> signIn(String username, String password) async {
    if (username == _username && password == _password) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    _isAuthenticated = false;
    notifyListeners();
  }
}