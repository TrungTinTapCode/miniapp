import 'package:flutter/foundation.dart';
import '../models/expense.dart';
import '../database/db_helper.dart';

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  ExpenseProvider() {
    // load existing expenses from DB
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final list = await DBHelper.getExpenses();
    _expenses.clear();
    _expenses.addAll(list);
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await DBHelper.insertExpense(expense);
    await _loadExpenses();
  }

  Future<void> removeExpense(String id) async {
    await DBHelper.deleteExpense(id);
    await _loadExpenses();
  }
}
