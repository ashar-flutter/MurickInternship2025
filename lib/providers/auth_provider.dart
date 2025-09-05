import 'package:flutter/material.dart';
import '../models/app_user.dart';
import '../screens/auth/signup_screen.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _s = AuthService();
  AppUser? user;
  bool loading = false;

  Future<void> loadUser() async {
    loading = true;
    notifyListeners();
    user = await _s.fetchCurrentUser();
    loading = false;
    notifyListeners();
  }

  Future<String?> signup(String e, String p, String r) async {
    loading = true;
    notifyListeners();
    final res = await _s.signup(e, p, r);
    if (res == null) await loadUser();
    loading = false;
    notifyListeners();
    return res;
  }

  Future<String?> login(String e, String p) async {
    loading = true;
    notifyListeners();
    final res = await _s.login(e, p);
    if (res == null) await loadUser();
    loading = false;
    notifyListeners();
    return res;
  }

  Future<void> logout(BuildContext context) async {
    await _s.signOut();
    user = null;
    notifyListeners();
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SignupScreen()),
      (_) => false,
    );
  }

  Future<String?> updateProfile({
    required String email,
    required String role,
  }) async {
    if (user == null) return 'No user logged in';
    final res = await _s.updateUser(user!.uid, email: email, role: role);
    if (res == null) {
      user = AppUser(uid: user!.uid, email: email, role: role);
      notifyListeners();
    }
    return res;
  }

  bool get isLoggedIn => user != null;
}
