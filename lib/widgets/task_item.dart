import 'package:flutter/material.dart';
import '../models/task.dart';
import '../constants/app_styles.dart';
import '../constants/app_colors.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
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
        secondary: IconButton(
          icon: const Icon(Icons.delete, color: AppColors.error),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
