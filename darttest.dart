import 'dart:io';

class Task {
  String description;
  String status;

  Task(this.description) : status = 'Pending';

  // Method to mark task as completed
  void markCompleted() {
    status = 'Completed';
  }
}

void main() {
  List<Task> tasks = [];
  bool exit = false;

  while (!exit) {
    print('\nTo-Do List Manager');
    print('---------------------');
    print('1. Add a task');
    print('2. Remove a task');
    print('3. View all tasks');
    print('4. Mark a task as completed');
    print('5. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Add a task
        stdout.write('Enter the task description: ');
        String? description = stdin.readLineSync();
        if (description != null && description.isNotEmpty) {
          tasks.add(Task(description));
          print('Task added!');
        } else {
          print('Task description cannot be empty.');
        }
        break;

      case '2':
        // Remove a task
        if (tasks.isEmpty) {
          print('No tasks available to remove.');
        } else {
          print('Current tasks:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i].description} - ${tasks[i].status}');
          }

          stdout.write('Enter the task number to remove: ');
          String? taskNumStr = stdin.readLineSync();
          if (taskNumStr != null) {
            int taskNum = int.tryParse(taskNumStr) ?? 0;
            if (taskNum >= 1 && taskNum <= tasks.length) {
              tasks.removeAt(taskNum - 1);
              print('Task removed!');
            } else {
              print('Invalid task number.');
            }
          }
        }
        break;

      case '3':
        // View all tasks
        if (tasks.isEmpty) {
          print('No tasks available.');
        } else {
          print('Current tasks:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i].description} - ${tasks[i].status}');
          }
        }
        break;

      case '4':
        // Mark a task as completed
        if (tasks.isEmpty) {
          print('No tasks available to mark as completed.');
        } else {
          print('Current tasks:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i].description} - ${tasks[i].status}');
          }

          stdout.write('Enter the task number to mark as completed: ');
          String? taskNumStr = stdin.readLineSync();
          if (taskNumStr != null) {
            int taskNum = int.tryParse(taskNumStr) ?? 0;
            if (taskNum >= 1 && taskNum <= tasks.length) {
              tasks[taskNum - 1].markCompleted();
              print('Task marked as completed!');
            } else {
              print('Invalid task number.');
            }
          }
        }
        break;

      case '5':
        // Exit the application
        print('Exiting the application...');
        exit = true;
        break;

      default:
        print('Invalid option. Please try again.');
        break;
    }
  }
}
