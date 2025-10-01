import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../constants/app_styles.dart';
import '../constants/app_colors.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  final VoidCallback onDelete;

  const ExpenseItem({
    super.key,
    required this.expense,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.attach_money, color: AppColors.success),
        title: Text(expense.title, style: AppStyles.title),
        subtitle: Text(
          "${expense.amount.toStringAsFixed(0)} VND\n${expense.date.toLocal()}",
          style: AppStyles.subtitle,
        ),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: AppColors.error),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
