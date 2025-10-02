import 'package:flutter/material.dart';
import '../models/task.dart';
import '../constants/app_styles.dart';
import '../constants/app_colors.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback? onEdit;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: CheckboxListTile(
        activeColor: AppColors.primary,
        title: Text(
          task.title,
          style: AppStyles.title.copyWith(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        value: task.isDone,
        onChanged: (_) => onToggle(),
        secondary: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: AppColors.primary),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: AppColors.error),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
