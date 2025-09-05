import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/app_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  Future<String?> signup(String email, String password, String role) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = cred.user!.uid;
      final user = AppUser(uid: uid, email: email, role: role);
      await _fire.collection('users').doc(uid).set(user.toMap());
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Signup failed';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Login failed';
    } catch (e) {
      return e.toString();
    }
  }

  Future<AppUser?> fetchCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) return null;
    final doc = await _fire.collection('users').doc(user.uid).get();
    if (!doc.exists) {
      return AppUser(
        uid: user.uid,
        email: user.email ?? '',
        role: 'student',
      );
    }
    return AppUser.fromMap({'uid': user.uid, ...?doc.data()});
  }

  Future<void> signOut() async {
    final user = _auth.currentUser;
    if (user != null) {
      await _fire.collection('users').doc(user.uid).delete();
    }
    await _auth.signOut();
  }

  Future<String?> updateUser(String uid, {required String email, required String role}) async {
    try {
      await _fire.collection('users').doc(uid).update({
        'email': email,
        'role': role,
      });
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}

