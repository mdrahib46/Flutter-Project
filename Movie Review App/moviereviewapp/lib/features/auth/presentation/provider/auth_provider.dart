import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/shared_pref_service.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  String? _username;
  bool _isLoading = false;

  User? get user => _user;
  String? get username => _username;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _init();
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> _init() async {
    _username = await SharedPrefService.getUsername();
    notifyListeners();
  }

  
  
  /// SignUp Function
  Future<String?> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    _setLoading(true);
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update display name with username in Firebase Auth
      await result.user?.updateDisplayName(username);
      
      // Save extra user info in Firestore
      await _firestore.collection('users').doc(result.user!.uid).set({
        'uid': result.user!.uid,
        'email': email,
        'username': username,
        'createdAt': FieldValue.serverTimestamp(),
        'profileImage': '',
        'followers': 0,
        'following': 0,
        'moviesWatched': 0,
      });

      await SharedPrefService.saveLoginState(true);
      await SharedPrefService.saveUserData(email: email, username: username);
      _username = username;
      
      _setLoading(false);
      return null; // Success
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      return e.message;
    } catch (e) {
      _setLoading(false);
      return e.toString();
    }
  }

  
  /// SignIn Function 
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch username from Firestore to save in SharedPreferences
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(result.user!.uid).get();
      String? username = userDoc.exists ? (userDoc.data() as Map<String, dynamic>)['username'] : null;

      await SharedPrefService.saveLoginState(true);
      await SharedPrefService.saveUserData(email: email, username: username);
      _username = username;

      _setLoading(false);
      return null; // Success
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      return e.message;
    } catch (e) {
      _setLoading(false);
      return e.toString();
    }
  }

  Future<String?> resetPassword({required String email}) async {
    _setLoading(true);
    try {
      await _auth.sendPasswordResetEmail(email: email);
      _setLoading(false);
      return null; // Success
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      return e.message;
    } catch (e) {
      _setLoading(false);
      return e.toString();
    }
  }
 
  /// Logout function
  Future<void> logout() async {
    await _auth.signOut();
    await SharedPrefService.clearAll();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
