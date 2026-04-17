import 'package:flutter/material.dart';

class FinanceViewModel extends ChangeNotifier {
  double _balance = 34.00;
  double _income = 0.0;
  double _essentialExpenses = 0.0;
  double _leisureExpenses = 0.0;

  double get balance => _balance;
  double get income => _income;
  double get essentialExpenses => _essentialExpenses;
  double get leisureExpenses => _leisureExpenses;

  double get availableToInvest => _income - _essentialExpenses - _leisureExpenses;

  void updateIncome(double value) {
    _income = value;
    notifyListeners();
  }

  void updateEssentialExpenses(double value) {
    _essentialExpenses = value;
    notifyListeners();
  }

  void updateLeisureExpenses(double value) {
    _leisureExpenses = value;
    notifyListeners();
  }
}
