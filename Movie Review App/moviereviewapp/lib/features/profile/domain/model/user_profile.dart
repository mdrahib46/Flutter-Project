class UserProfile {
  final String name;
  final String username;
  final String profileImage;
  final String bannerImage;
  final int followers;
  final int following;
  final int moviesWatched;
  final String timeSpent;

  UserProfile({
    required this.name,
    required this.username,
    required this.profileImage,
    required this.bannerImage,
    required this.followers,
    required this.following,
    required this.moviesWatched,
    required this.timeSpent,
  });
}
