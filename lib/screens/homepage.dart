import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/task.dart';
import 'package:todoapp/widgets/loader.dart';

import '../widgets/add_new_task.dart';
import '../widgets/list.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;

  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();

  Future<void> loadData() async {
    Provider.of<TaskProvider>(context, listen: false).setLoader(true);
    await Future.delayed(const Duration(seconds: 2));
    Provider.of<TaskProvider>(context, listen: false).setLoader(false);
  }

  @override
  void initState() {
    loadData(); // Call loadData() method here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TASK LIST',
          style: TextStyle(fontSize: 18),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => AddNewTask(isEditMode: false),
              );
            },
          ),
        ],
      ),
      body: Consumer<TaskProvider>(builder: (context, task, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (task.getLoader())
              const Opacity(
                opacity: 0,
                child: ModalBarrier(dismissible: false, color: Colors.purple),
              ),
            if (task.getLoader())
              Center(
                child: Center(child: AnimatedLoader()),
              ),
            List(),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddNewTask(isEditMode: false),
          );
        },
        tooltip: 'Add a new item!',
      ),
    );
  }
}
