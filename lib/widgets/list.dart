import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';
import './list_item.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TaskProvider>(context).itemsList;
    return taskList.length > 0
        ? ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return ListItem(taskList[index]);
            },
          )
        : LayoutBuilder(
            builder: (ctx, constraints) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight * 0.5,
                      child:
                          Image.asset('assets/no-data.png', fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'No tasks added yet...',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            },
          );
  }
}
