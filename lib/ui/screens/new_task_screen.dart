import 'package:flutter/material.dart';

import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSummarySection(),
            ListView.separated(
              primary: false,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index){
                  return TaskCard(taskStatus: TaskStatus.sNew, chipText: "New",);
            }, separatorBuilder: (context, index)=> SizedBox(height: 6,))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
    );
  }

  Widget _buildSummarySection() {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SummaryCard(title: 'New', count: 15,),
                SummaryCard(title: 'Progress', count: 23,),
                SummaryCard(title: 'Completed', count: 8,),
                SummaryCard(title: 'Cancelled', count: 5,),
              ],
            ),
          ),
        );
  }
}



