import 'package:flutter/material.dart';
import 'package:task_project/api/httpnetwork.dart';
import 'package:task_project/api/models/task_models.dart';
import 'package:task_project/api/urls.dart';
import 'package:task_project/ui/screen/component/snackbar_message_screen.dart';
import '../../widgets/cardlistview_widget.dart';
import '../component/topcard_Widget.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});
  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskModel newTaskmodel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllNewTask();
  }

  Future<void> getAllNewTask() async {
    inProgress = true;
    setState(() {});
    final response = await HTTPNetWorkUtils().getMethod(Urls.newTask);
    if (response != null) {
      newTaskmodel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(context, "Unable to fetch new task! try again");
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    TopCardWidget(),
                    SizedBox(
                      width: 8,
                    ),
                    TopCardWidget(),
                    SizedBox(
                      width: 8,
                    ),
                    TopCardWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                  child: inProgress
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            await getAllNewTask();
                          },
                          child: ListView.builder(
                              itemCount: newTaskmodel.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                return CardListViewWidget(
                                  headText: newTaskmodel.data?[index].title ??
                                      "Unknown",
                                  descriptions:
                                      newTaskmodel.data?[index].description ??
                                          "Unknown",
                                  date: newTaskmodel.data?[index].createdDate ??
                                      "Unknown",
                                  type: "New",
                                  onDeletePressed: () {},
                                  onEditPressed: () {},
                                );
                              }),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}


