import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';

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
                return CheckboxListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  value: task.isDone,
                  onChanged: (_) {
                    taskProvider.toggleTask(task.id);
                  },
                  secondary: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      taskProvider.removeTask(task.id);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Thêm dữ liệu test nhanh
          taskProvider.addTask(Task(
            id: DateTime.now().toString(),
            title: "Làm bài tập Flutter",
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
