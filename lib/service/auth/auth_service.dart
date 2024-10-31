// auth_service.dart
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxController {
  final _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  // Create ValueNotifier for auth state
  final authState = ValueNotifier<bool>(false);

  @override
  void onInit() {
    super.onInit();
    _initializeAuthState();
  }

  Future<void> _initializeAuthState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isLogged = prefs.getBool('isLoggedIn');
    _isLoggedIn.value = isLogged ?? false;
    authState.value = isLogged ?? false; // Set authState value too
    print('Init auth state: ${_isLoggedIn.value}');
  }

  // Simulate login
  Future<bool> login(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Mock login success
    print("Logging in...");
    await Future.delayed(const Duration(seconds: 1));

    _isLoggedIn.value = true;
    authState.value = true;

    await prefs.setBool('isLoggedIn', true);
    print('Login completed, isLoggedIn: ${_isLoggedIn.value}');

    return true;
  }

  // Simulate logout
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(milliseconds: 500));
    _isLoggedIn.value = false;
    authState.value = false;

    await prefs.setBool('isLoggedIn', false); // Clear the stored login state
    // หรือจะใช้ remove ก็ได้
    // await prefs.remove('isLoggedIn');
    // Remove data for the 'counter' key.
    print('Logout completed');
  }
}
