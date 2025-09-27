import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../models/expense.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final expenses = expenseProvider.expenses;

    return Scaffold(
      body: expenses.isEmpty
          ? const Center(child: Text("Chưa có khoản chi tiêu nào"))
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (ctx, i) {
                final Expense expense = expenses[i];
                return ListTile(
                  leading: const Icon(Icons.money),
                  title: Text(expense.title),
                  subtitle: Text(
                      "${expense.amount.toStringAsFixed(0)} VND - ${expense.date.toLocal()}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      expenseProvider.removeExpense(expense.id);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Thêm dữ liệu test nhanh
          expenseProvider.addExpense(Expense(
            id: DateTime.now().toString(),
            title: "Mua cà phê",
            amount: 20000,
            date: DateTime.now(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
