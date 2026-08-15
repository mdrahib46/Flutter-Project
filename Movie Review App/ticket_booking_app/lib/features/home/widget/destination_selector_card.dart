
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_colors.dart';
import '../presentation/provider/home_screen_provider.dart';

class DestinationSelector extends StatelessWidget {
  const DestinationSelector({super.key, required this.isFrom, required this.provider});
  final bool isFrom;
  final HomeScreenProvider provider;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[800] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            isFrom ? 'Select Departure' : 'Select Destination',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: provider.airports.length,
              separatorBuilder: (context, index) => Divider(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
              itemBuilder: (context, index) {
                final airport = provider.airports[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    child: const Icon(
                      Icons.flight,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    airport,
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    if (isFrom) {
                      provider.setFromAirport(airport);
                    } else {
                      provider.setToAirport(airport);
                    }
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
