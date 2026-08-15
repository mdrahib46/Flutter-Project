import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/widget/app_backgroud.dart';
import '../../widget/custom_home_appbar_widget.dart';
import '../../widget/destination_selector_card.dart';
import '../../widget/home_section_header.dart';
import '../../widget/passenger_selection_widget.dart';
import '../../widget/trip_types.dart';
import '../provider/home_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenProvider _homeScreenProvider = HomeScreenProvider();
  final TextEditingController dateController = TextEditingController();

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController passengerController = TextEditingController();
  final TextEditingController classController = TextEditingController();

  void _syncControllers(HomeScreenProvider provider) {
    fromController.text = provider.fromAirport;
    toController.text = provider.toAirport;
    dateController.text = provider.formattedDepartureDate;
    passengerController.text =
        "${provider.passengersCount} Seat${provider.passengersCount > 1 ? 's' : ''}";
    classController.text = provider.selectedPassengerClass;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ChangeNotifierProvider(
      create: (_) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(
        builder: (context, provider, _) {
          _syncControllers(provider);
          return AppBackground(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const CustomHomeAppBar(),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkCard
                            : AppColors.lightCard,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                provider.tripTypes.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: TripTypeButton(
                                    onTap: () => provider.selectTrip(index),
                                    text: provider.tripTypes[index],
                                    selected:
                                        provider.selectedTripIndex == index,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 25),

                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Column(
                                children: [
                                  TextFormField(
                                    controller: fromController,
                                    readOnly: true,
                                    style: TextStyle(
                                      color: isDark
                                          ? AppColors.darkTextPrimary
                                          : AppColors.lightTextPrimary,
                                    ),

                                    decoration: InputDecoration(
                                      labelText: "From",
                                      prefix: Icon(Icons.flight_takeoff),
                                    ),
                                    onTap: () =>
                                        _showAirportSelectionModalSheet(
                                          context,
                                          true,
                                        ),
                                  ),
                                  const SizedBox(height: 12),
                                  TextFormField(
                                    controller: toController,
                                    readOnly: true,
                                    style: TextStyle(
                                      color: isDark
                                          ? AppColors.darkTextPrimary
                                          : AppColors.lightTextPrimary,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "To",
                                      prefix: Icon(Icons.flight_land),
                                    ),
                                    onTap: () =>
                                        _showAirportSelectionModalSheet(
                                          context,
                                          false,
                                        ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 15,
                                child: GestureDetector(
                                  onTap: provider.swapAirports,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.swap_vert,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          TextFormField(
                            controller: dateController,
                            readOnly: true,
                            style: TextStyle(
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.lightTextPrimary,
                            ),

                            decoration: InputDecoration(
                              labelText: "Departure Date",
                              prefix: Icon(Icons.calendar_month),
                            ),
                            onTap: () => _selectDate(context, provider),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: passengerController,
                                  readOnly: true,
                                  style: TextStyle(
                                    color: isDark
                                        ? AppColors.darkTextPrimary
                                        : AppColors.lightTextPrimary,
                                  ),

                                  decoration: InputDecoration(
                                    labelText: "Passengers",
                                    prefix: Icon(Icons.people_outline),
                                  ),
                                  onTap: () =>
                                      _showPassengersModal(context, provider),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: TextFormField(
                                  controller: classController,
                                  readOnly: true,
                                  style: TextStyle(
                                    color: isDark
                                        ? AppColors.darkTextPrimary
                                        : AppColors.lightTextPrimary,
                                  ),

                                  decoration: InputDecoration(
                                    labelText: "Class",
                                    prefix: Icon(
                                      Icons.airline_seat_recline_normal,
                                    ),
                                  ),
                                  onTap: () =>
                                      _showClassModal(context, provider),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          /// Search Button
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Search Flights",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    HomeSectionHeader(title: 'Special Offers', onTap: () {  },),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showPassengersModal(BuildContext context, HomeScreenProvider provider) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: provider,
          child: const PassengerSelectionWidget(),
        );
      },
    );
  }

  void _showClassModal(BuildContext context, HomeScreenProvider provider) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Class',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: 10),

              for (final c in provider.passengerClasses)
                ListTile(
                  title: Text(
                    c,
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                  ),
                  trailing: provider.selectedPassengerClass == c
                      ? const Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () {
                    provider.selectPassengerClass(c);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _selectDate(BuildContext context, HomeScreenProvider provider) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: provider.departureDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: isDark
              ? ThemeData.dark().copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: AppColors.primary,
                    surface: AppColors.darkCard,
                    onSurface: AppColors.darkTextPrimary,
                  ),
                )
              : ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.primary,
                  ),
                ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      provider.setDepartureDate(picked);
    }
  }

  void _showAirportSelectionModalSheet(BuildContext context, bool isForm) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final provider = context.read<HomeScreenProvider>();
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return DestinationSelector(isFrom: isForm, provider: provider);
      },
    );
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    dateController.dispose();
    passengerController.dispose();
    classController.dispose();
    _homeScreenProvider.dispose();
    super.dispose();
  }
}


