import 'package:flutter/foundation.dart';

enum SearchScreenState { searchResults, savedLocations, selectedLocation }

class SearchScreenStateManager extends ChangeNotifier {
  SearchScreenState _currentState = SearchScreenState.savedLocations;

  // SearchScreenState _currentState;
  SearchScreenState get state => _currentState;

  void toggleScreenState(SearchScreenState requestedState) {
    if (requestedState == SearchScreenState.savedLocations) {
      _currentState = requestedState;
    } else if (requestedState == SearchScreenState.searchResults) {
      _currentState = requestedState;
    } else if (requestedState == SearchScreenState.selectedLocation) {
      _currentState = requestedState;
    }
    notifyListeners();
  }
}
