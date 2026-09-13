import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_colors.dart';
import '../../../shared/presentation/provider/bottom_nav_provider.dart';
import '../provider/profile_provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final profile = profileProvider.userProfile;

    if (profile == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.all(16),
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.blue.withOpacity(0.5), width: 2),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1B3A4B),
            Color(0xFF001C29),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            // Banner
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 180,
              child: Image.asset(
                profile.bannerImage,
                fit: BoxFit.cover,
              ),
            ),
            // Gradient on banner
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Back Button
            Positioned(
              top: 16,
              left: 16,
              child: InkWell(
                onTap: () {
                  final navProvider =
                      Provider.of<BottomNavProvider>(context, listen: false);
                  if (navProvider.selectedIndex != 0) {
                    navProvider.navigateToHome();
                  } else if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                ),
              ),
            ),

            // Profile Image
            Positioned(
              top: 120,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF001C29), width: 4),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profile.profileImage),
                ),
              ),
            ),

            // User Info
            Positioned(
              bottom: 25,
              left: 130,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    profile.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@${profile.username}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _followInfo(profile.followers.toString(), 'Followers'),
                      const SizedBox(width: 16),
                      _followInfo(profile.following.toString(), 'Following'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _followInfo(String count, String label) {
    return Row(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
