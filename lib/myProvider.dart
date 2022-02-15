import 'package:flutter/material.dart';

class CurrentProject with ChangeNotifier {
  String _projectName = 'project name';
  String get projectName => _projectName;

  void changeProject(String projectName) {
    _projectName = projectName;
    notifyListeners();
  }
}
