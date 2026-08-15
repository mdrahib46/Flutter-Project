import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../presentation/provider/home_screen_provider.dart';

class PassengerSelectionWidget extends StatelessWidget {
  const PassengerSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Consumer<HomeScreenProvider>(
      builder: (context, provider, _) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Passengers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Passengers',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                  ),

                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: AppColors.primary,
                        ),
                        onPressed: () => provider.setPassengersCount(
                          provider.passengersCount - 1,
                        ),
                      ),

                      Text(
                        '${provider.passengersCount}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: AppColors.primary,
                        ),
                        onPressed: () => provider.setPassengersCount(
                          provider.passengersCount + 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}