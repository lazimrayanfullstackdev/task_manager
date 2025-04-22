import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: 6,
          itemBuilder: (context, index) {
            return TaskCard(taskStatus: TaskStatus.cancelled, chipText: 'Cancelled',);
          },
          separatorBuilder: (context, index) => SizedBox(height: 6,)),
    );
  }
}



