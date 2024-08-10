import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderSubscription extends ChangeNotifier {
  bool _isSub = false;

  bool get sub => _isSub;

  void setsub(bool sub) async {
    if (_isSub != sub) {
      _isSub = sub;
      notifyListeners();
      await _savesub(); // Save subscription status when changed
    }
  }

  bool getCurrentsub() {
    return _isSub;
  }

  // Save subscription status
  Future<void> _savesub() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSub', _isSub); // Use setBool for boolean values
  }

  // Load saved subscription status
  Future<void> loadSavedsub() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedsub = prefs.getBool('isSub');
    if (savedsub != null) {
      _isSub = savedsub;
      notifyListeners(); // Notify listeners after loading
    }
  }
}
