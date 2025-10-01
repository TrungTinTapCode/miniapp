import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  // Tiêu đề chính
  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Nội dung nhỏ
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  // Công việc hoàn thành
  static const TextStyle doneTask = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    decoration: TextDecoration.lineThrough,
  );

  // Công việc chưa hoàn thành
  static const TextStyle pendingTask = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}
