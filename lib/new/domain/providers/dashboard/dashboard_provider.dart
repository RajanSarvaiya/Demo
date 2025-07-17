import 'dart:collection';

import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  int currentIndex = 0;
  ListQueue<int> navigationQueue = ListQueue(0);

  /*Function(int)?*/ onTapped(int index) {
    if (index == 0) {
      navigationQueue.clear();
    }
    currentIndex = index;
    navigationQueue.add(index);
    notifyListeners();
  }

  void clearProvider() {
    currentIndex = 0;
    navigationQueue.clear();
  }

}