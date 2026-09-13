import 'package:flutter/material.dart';
import '../../../../app/asset_path.dart';
import '../../domain/model/user_profile.dart';

class ProfileProvider extends ChangeNotifier {
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  ProfileProvider() {
    // Initializing with dummy data for now
    _userProfile = UserProfile(
      name: 'Dilhara Sannasgala',
      username: 'dilhara24',
      profileImage: AssetPath.dummyImage2,
      bannerImage: AssetPath.splashBanner,
      followers: 100,
      following: 120,
      moviesWatched: 2000,
      timeSpent: '24m 30d 23h',
    );
  }

  // Method to update profile or fetch from API can be added here
  void updateProfile(UserProfile profile) {
    _userProfile = profile;
    notifyListeners();
  }
}
