import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import '../widgets/task_item.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;

    return Scaffold(
      body: tasks.isEmpty
          ? const Center(child: Text("Chưa có công việc nào"))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, i) {
                final Task task = tasks[i];
                return TaskItem(
                  task: task,
                  onToggle: () => taskProvider.toggleTask(task.id),
                  onDelete: () => taskProvider.removeTask(task.id),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Thêm dữ liệu test nhanh
          taskProvider.addTask(
            Task(
              id: DateTime.now().toString(),
              title: "Làm bài tập Flutter",
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
