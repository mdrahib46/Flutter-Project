import 'package:flutter/material.dart';
import '../../../../app/asset_path.dart';
import '../../../../core/app_colors.dart';

class LoggerScreen extends StatelessWidget {
  const LoggerScreen({super.key});

  static const String name = '/logger';

  @override
  Widget build(BuildContext context) {
    // Mock data for ListView.builder
    final List<Map<String, dynamic>> logData = [
      {'title': 'Furiosa: A Mad Max Saga', 'rating': 4, 'image': AssetPath.dummyImage, 'showEye': false},
      {'title': 'IF', 'rating': 3, 'image': AssetPath.dummyImage1, 'showEye': false},
      {'title': 'Point Break', 'rating': 3, 'image': AssetPath.dummyImage2, 'showEye': false},
      {'title': 'Hunger', 'rating': 4, 'image': AssetPath.dummyImage, 'showEye': false},
      {'title': 'Abigail', 'rating': 4, 'image': AssetPath.dummyImage1, 'showEye': true},
      {'title': 'Atlas', 'rating': 3, 'image': AssetPath.dummyImage2, 'showEye': false},
      {'title': 'Hit Man', 'rating': 3, 'image': AssetPath.dummyImage, 'showEye': false},
      {'title': 'Ninja: Shadow of a Tear', 'rating': 3, 'image': AssetPath.dummyImage1, 'showEye': false},
      {'title': 'Ninja', 'rating': 2, 'image': AssetPath.dummyImage2, 'showEye': true},
      {'title': 'Challengers', 'rating': 5, 'image': AssetPath.dummyImage, 'showEye': true},
    ];

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Logger',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white70),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: logData.length + 1, // +1 for the header
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: _buildDateHeader(Icons.calendar_month, 'June, 2024'),
            );
          }

          final item = logData[index - 1];
          return _buildLogItem(
            day: index.toString().padLeft(2, '0'), // Using index as day
            title: item['title'],
            rating: item['rating'],
            image: item['image'],
            showEye: item['showEye'] ?? false,
          );
        },
      ),
    );
  }

  Widget _buildDateHeader(IconData icon, String date) {
    return Row(
      children: [
        Icon(icon, color: Colors.white60, size: 20),
        const SizedBox(width: 10),
        Text(
          date,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildLogItem({
    required String day,
    required String title,
    required int rating,
    required String image,
    bool showEye = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SizedBox(
            width: 40,
            child: Text(
              day,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        rating,
                        (index) => const Padding(
                          padding: EdgeInsets.only(right: 2.0),
                          child: Icon(
                            Icons.star,
                            size: 14,
                            color: AppColors.accent,
                          ),
                        ),
                      ),
                    ),
                    if (showEye) ...[
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 14,
                        color: Colors.white38,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                image,
                width: 60,
                height: 67,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
