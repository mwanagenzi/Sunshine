import 'package:flutter/foundation.dart';

enum SearchScreenState { searchResults, savedLocations }

class SearchScreenStateManager extends ChangeNotifier {
  SearchScreenState currentState = SearchScreenState.savedLocations;

  void toggleScreenState(SearchScreenState requestedState) {
    if (requestedState == SearchScreenState.savedLocations) {
      currentState = requestedState;
    } else if (requestedState == SearchScreenState.searchResults) {
      currentState = requestedState;
    }
    notifyListeners();
  }
}
