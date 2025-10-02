import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../models/expense.dart';
import '../widgets/expense_item.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  void _openAddExpenseForm(BuildContext context) {
    final _titleController = TextEditingController();
    final _amountController = TextEditingController();
    DateTime? _selectedDate;

    void _submit(ExpenseProvider provider) {
      final title = _titleController.text.trim();
      final amount =
          double.tryParse(_amountController.text.replaceAll(',', '.')) ?? 0;
      final date = _selectedDate ?? DateTime.now();

      if (title.isEmpty || amount <= 0) {
        // simple validation
        return;
      }

      provider.addExpense(
        Expense(
          id: DateTime.now().toIso8601String(),
          title: title,
          amount: amount,
          date: date,
        ),
      );

      Navigator.of(context).pop();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        final provider = Provider.of<ExpenseProvider>(ctx, listen: false);
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Tiêu đề'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Số tiền'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Chưa chọn ngày'
                          : 'Ngày: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                    ),
                  ),
                  TextButton(
                    child: const Text('Chọn ngày'),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: ctx,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() {
                          _selectedDate = picked;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text('Huỷ'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                  ElevatedButton(
                    child: const Text('Lưu'),
                    onPressed: () => _submit(provider),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final expenses = expenseProvider.expenses;

    return Scaffold(
      body:
          expenses.isEmpty
              ? const Center(child: Text("Chưa có khoản chi tiêu nào"))
              : ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (ctx, i) {
                  final Expense expense = expenses[i];
                  return ExpenseItem(
                    expense: expense,
                    onDelete: () => expenseProvider.removeExpense(expense.id),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddExpenseForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
