import 'package:flutter/material.dart';
import 'package:ease/model/navigation_item.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationItem _navigationItem = NavigationItem.home;

  // get navigation item
  NavigationItem get navigationItem => _navigationItem;

  // update navigation item
  void setNavigationItem(NavigationItem navigationItem) {
    _navigationItem = navigationItem;

    notifyListeners(); // update ui
  }

}