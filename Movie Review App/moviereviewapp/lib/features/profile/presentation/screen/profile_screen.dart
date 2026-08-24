import 'package:flutter/material.dart';
import 'package:moviereviewapp/features/auth/presentation/widget/GlassContainerBG.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              GlassContainerBG(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Row(
                        spacing: 8,
                        children: [
                          CircleAvatar(radius: 48),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Md Rahib',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('@rahib086'),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                children: [
                                  Text(
                                    '500',
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text('Followers'),
                                  const SizedBox(width: 26),
                                  Text(
                                    '420',
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text('Followings'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
