import 'package:flutter/foundation.dart';

enum SearchScreenState { searchResults, savedLocations, selectedLocation }

class SearchScreenStateManager extends ChangeNotifier {
  SearchScreenState _state = SearchScreenState.savedLocations;

  // SearchScreenState _state;
  SearchScreenState get state => _state;

  void toggleScreenState(SearchScreenState requestedState) {
    // if (requestedState == SearchScreenState.savedLocations) {
    //   _state = requestedState;
    // } else if (requestedState == SearchScreenState.searchResults) {
    //   _state = requestedState;
    // } else if (requestedState == SearchScreenState.selectedLocation) {
    //   _state = requestedState;
    // }
    _state = requestedState;
    notifyListeners();
  }
}
