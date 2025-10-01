import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import '../widgets/task_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).loadTasks();
  }

  void _addTaskDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Thêm công việc"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Nhập công việc..."),
        ),
        actions: [
          TextButton(
            child: const Text("Huỷ"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Lưu"),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(Task(title: controller.text));
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return TaskItem(
            task: task,
            onToggle: () => taskProvider.toggleTask(task),
            onDelete: () => taskProvider.deleteTask(task.id!),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
