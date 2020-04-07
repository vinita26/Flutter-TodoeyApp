import 'package:flutter/material.dart';
import './tasks_tile.dart';
import 'package:provider/provider.dart';
import '../model/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskName: task.name,
            isChecked: task.isDone,
            checkBoxCallBack: (checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallBack: () {
              taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
