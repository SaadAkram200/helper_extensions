import 'package:flutter/material.dart';

extension ContextUtilities on BuildContext {
  // Screen dimensions & paddings
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get leftPadding => MediaQuery.of(this).padding.left;
  double get rightPadding => MediaQuery.of(this).padding.right;

  // Theme & Styles
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textStyles => Theme.of(this).textTheme;

  // Navigation helpers
  Future<dynamic> push(
      {required Widget child, bool rootNavigator = false}) async {
    return await Navigator.of(this, rootNavigator: rootNavigator)
        .push(MaterialPageRoute(builder: (ctx) => child));
  }

  Future<dynamic> pushReplacement(
      {required Widget child, bool rootNavigator = false}) async {
    return await Navigator.of(this, rootNavigator: rootNavigator)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => child));
  }

  Future<dynamic> pushAndRemoveUntil(
      {required Widget child, bool rootNavigator = false}) async {
    return await Navigator.of(this, rootNavigator: rootNavigator)
        .pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => child),
      (route) => false,
    );
  }

  bool canPop() => Navigator.of(this).canPop();

  void pop({dynamic data, bool rootNavigator = false}) {
    if (canPop()) {
      Navigator.of(this, rootNavigator: rootNavigator).pop(data);
    }
  }
}
