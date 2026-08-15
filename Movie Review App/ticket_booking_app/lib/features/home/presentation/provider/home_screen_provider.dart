import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreenProvider extends ChangeNotifier {
  final List<String> tripTypes = ['One-Way', 'Round Trip', 'Multi-City'];
  
  int _selectedTripIndex = 0;
  int get selectedTripIndex => _selectedTripIndex;

  void selectTrip(int index) {
    if (_selectedTripIndex == index) return;
    _selectedTripIndex = index;
    notifyListeners();
  }

  final List<String> airports = [
    'Dhaka (DAC)',
    'Chittagong (CGP)',
    'Sylhet (ZYL)',
    'Cox\'s Bazar (CXB)',
    'Rajshahi (RJH)',
    'New York (JFK)',
    'Paris (CDG)',
    'London (LHR)',
  ];

  String _fromAirport = 'New York (JFK)';
  String _toAirport = 'Paris (CDG)';

  String get fromAirport => _fromAirport;
  String get toAirport => _toAirport;

  void setFromAirport(String airport) {
    _fromAirport = airport;
    notifyListeners();
  }

  void setToAirport(String airport) {
    _toAirport = airport;
    notifyListeners();
  }

  void swapAirports() {
    final temp = _fromAirport;
    _fromAirport = _toAirport;
    _toAirport = temp;
    notifyListeners();
  }

  DateTime _departureDate = DateTime.now();
  DateTime get departureDate => _departureDate;
  
  String get formattedDepartureDate => DateFormat('EEEE, MMM d, yyyy').format(_departureDate);

  void setDepartureDate(DateTime date) {
    _departureDate = date;
    notifyListeners();
  }

  int _passengersCount = 1;
  int get passengersCount => _passengersCount;

  void setPassengersCount(int count) {
    if (count < 1) return;
    _passengersCount = count;
    notifyListeners();
  }

  final List<String> passengerClasses = [
    'Economy',
    'Premium Economy',
    'Business',
    'First Class',
  ];

  String _selectedPassengerClass = 'Economy';
  String get selectedPassengerClass => _selectedPassengerClass;

  void selectPassengerClass(String value) {
    _selectedPassengerClass = value;
    notifyListeners();
  }
}
