import 'package:flutter/material.dart';

enum TaskStatus{
  sNew,
  progress,
  completed,
  cancelled
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.taskStatus, required this.chipText,
  });

  final TaskStatus taskStatus;

  final String chipText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title will be here", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
            Text("Description will be here"),
            Text("Date will be here"),
            Row(
              children: [
                Chip(label: Text(chipText,style: TextStyle(color: Colors.white),),shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  backgroundColor: _getChipColor(),
                  side: BorderSide.none,),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Color _getChipColor(){
    late Color color;
    switch(taskStatus){
      case TaskStatus.sNew:
        color = Colors.blue;
      case TaskStatus.progress:
        color = Colors.purple;
      case TaskStatus.completed:
        color = Colors.green;
      case TaskStatus.cancelled:
        color = Colors.red;
    }
    return color;
  }
}
