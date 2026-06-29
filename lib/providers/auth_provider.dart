import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;
  String? _error;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  AuthProvider() {
    _authService.authStateChanges.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<bool> signUp(String name, String email, String password) async {
    _setLoading(true);
    _error = null;
    final result = await _authService.signUp(
      name: name, email: email, password: password,
    );
    _setLoading(false);
    if (!result['success']) _error = result['error'];
    notifyListeners();
    return result['success'];
  }

  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    _error = null;
    final result = await _authService.signIn(
      email: email, password: password,
    );
    _setLoading(false);
    if (!result['success']) _error = result['error'];
    notifyListeners();
    return result['success'];
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
