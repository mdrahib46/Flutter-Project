
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../app/asset_path.dart';
import '../../domain/model/user_profile.dart';

class ProfileProvider extends ChangeNotifier {
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  ProfileProvider() {
    _loadUserProfile();
  }

  void _loadUserProfile() {
    final user = FirebaseAuth.instance.currentUser;
    
    // Initializing with data from Firebase if available, else fallback to dummy
    _userProfile = UserProfile(
      name: user?.displayName ?? 'Dilhara Sannasgala',
      username: user?.email?.split('@')[0] ?? 'dilhara24',
      profileImage: AssetPath.dummyImage2,
      bannerImage: AssetPath.splashBanner,
      followers: 100,
      following: 120,
      moviesWatched: 2000,
      timeSpent: '24m 30d 23h',
    );
    notifyListeners();
  }

  // Method to update profile or fetch from API can be added here
  void updateProfile(UserProfile profile) {
    _userProfile = profile;
    notifyListeners();
  }
}
