import 'package:flutter/widgets.dart';

class NavbarTabManager extends ChangeNotifier {
  int selectedTab = 0;

  void goToTab(index) {
    selectedTab = index;
    notifyListeners();
  }
}
