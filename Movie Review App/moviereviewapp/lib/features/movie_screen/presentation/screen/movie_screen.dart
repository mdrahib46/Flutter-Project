import 'package:flutter/material.dart';
import '../../../../app/asset_path.dart';
import '../../../../core/app_colors.dart';
import '../../../auth/presentation/widget/GlassContainerBG.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderCard(),
                const SizedBox(height: 20),
                _buildActionButtons(),
                const SizedBox(height: 20),
                _buildDescription(),
                const SizedBox(height: 24),
                _buildCastsSection(),
                const SizedBox(height: 24),
                _buildRatingsSection(),
                const SizedBox(height: 24),
                _buildReviewsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return GlassContainerBG(
      height: null,
      borderRadius: BorderRadius.circular(32),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AssetPath.dummyImage2,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: const Icon(Icons.share_outlined, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AssetPath.dummyImage,
                    width: 100,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Harry Potter and the Prisoner of Azkaban',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(Icons.movie_filter_outlined, 'Directed by Alfonso Cuarón'),
                      const SizedBox(height: 4),
                      _buildInfoRow(Icons.people_outline, 'Starring Daniel Radcliffe, Rupert Grint, Emma Watson'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.white24),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMetadata(Icons.access_time, '2 hr 21 min'),
                _buildMetadata(Icons.calendar_today, 'May 31, 2024'),
                _buildMetadata(Icons.remove_red_eye_outlined, 'Not Watched'),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: Colors.white70),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildMetadata(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.white60),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildSecondaryButton(Icons.play_circle_outline, 'Watch Trailer'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildSecondaryButton(Icons.add_circle_outline, 'Add to Wishlist'),
        ),
        const SizedBox(width: 12),
        _buildYellowButton(),
      ],
    );
  }

  Widget _buildSecondaryButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildYellowButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.add, color: Colors.black, size: 18),
          SizedBox(width: 4),
          Text(
            'Log',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return const Text(
      'Year three at Hogwarts means new fun and challenges as Harry learns the delicate art of approaching a Hippogriff, transforming shape-shifting Boggarts into hilarity and even turning back time. But the term also brings danger: soul-sucking Dementors hover over the school, an ally of the accursed He-Who-Cannot-Be-Named lurks within the castle walls, and fearsome wizard Sirius Black escapes Azkaban. And Harry will confront them all.',
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
    );
  }

  Widget _buildCastsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildTab('Casts', true),
            const SizedBox(width: 16),
            _buildTab('Crews', false),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AssetPath.dummyImage),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.accent : Colors.white60,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 20,
            color: AppColors.accent,
          ),
      ],
    );
  }

  Widget _buildRatingsSection() {
    return GlassContainerBG(
      height: null,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ratings',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(10, (index) {
                        double height = [20.0, 30.0, 25.0, 35.0, 45.0, 40.0, 80.0, 50.0, 60.0, 75.0][index];
                        return Container(
                          width: 8,
                          height: height,
                          decoration: BoxDecoration(
                            color: index > 5 ? AppColors.accent : Colors.white24,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  children: const [
                    Text(
                      'user rating',
                      style: TextStyle(color: Colors.white60, fontSize: 10),
                    ),
                    Text(
                      '4.1',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Reviews',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'See All',
              style: TextStyle(color: AppColors.accent, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildReviewCard('Sahil', 4, 'A perfect harry potter movie'),
        const SizedBox(height: 12),
        _buildReviewCard('Mehany', 5, 'when hermione punched malfoy in the face and then watched herself do it again... it\'s everything to me'),
      ],
    );
  }

  Widget _buildReviewCard(String user, int rating, String review) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Review by ',
              style: const TextStyle(color: Colors.white60, fontSize: 10),
              children: [
                TextSpan(
                  text: user,
                  style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: AppColors.accent,
                size: 14,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            review,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.favorite, size: 12, color: Colors.white60),
                SizedBox(width: 4),
                const Text('1.1k', style: TextStyle(color: Colors.white60, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
