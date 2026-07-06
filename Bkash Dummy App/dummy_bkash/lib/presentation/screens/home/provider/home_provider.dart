
import 'package:flutter/material.dart';

import '../../../../data/model/home_menu_item_model.dart';

class HomeProvider extends ChangeNotifier {
  final List<HomeMenuItemModel> _allItems = HomeMenuItemModel.sampleData;
  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  List<HomeMenuItemModel> get visibleItems {
    if (_isExpanded) {
      return _allItems;
    } else {
      return _allItems.take(8).toList();
    }
  }

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
