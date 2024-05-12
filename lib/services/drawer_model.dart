import 'package:flutter/material.dart';

class SetupStatusModel extends ChangeNotifier {
  bool _isSetupCompleted = false;

  bool get isSetupCompleted => _isSetupCompleted;

  void setSetupCompletionStatus(bool isCompleted) {
    _isSetupCompleted = isCompleted;
    notifyListeners();
  }
}
