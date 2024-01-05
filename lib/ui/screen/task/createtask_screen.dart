import 'package:flutter/material.dart';
import 'package:task_project/api/auth_utils.dart';
import 'package:task_project/api/httpnetwork.dart';
import 'package:task_project/api/urls.dart';
import '../../utils/text_style.dart';
import '../../widgets/elevatedbutton_widget.dart';
import '../../widgets/textfromfiled_widget.dart';
import '../component/bottomnavigation_screen.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});
  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {

  final TextEditingController _descriptionETController = TextEditingController();
  final TextEditingController _titleETController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Your Task",
                style: head1TextStyle,

              ),
              const SizedBox(height: 8,),
              TextFromFiledWidget(
                hintText: 'Title',
                controller: _titleETController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Your Email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8,),
              TextFromFiledWidget(
                hintText: 'Descriptions',
                maxLines: 5,
                controller: _descriptionETController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Your Email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8,),
              if(_inProgress)
                const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.green,
                  ),
                )
              else
              ElevatedButtonWidget(
                onPressed: () async {
                  if(_fromKey.currentState!.validate()){
                    _inProgress = true;
                    setState(() {});
                    final result = await HTTPNetWorkUtils().postMethod(
                      Urls.createTask,
                      token: AuthUtils.token,
                      body: {
                        "title": _titleETController.text.trim(),
                        "description": _descriptionETController.text.trim(),
                        "status":"New",
                      }
                    );
                    _inProgress = false;
                    setState(() {

                    });
                    print(result);
                    if(result != null && result['status']=='success'){
                      _titleETController.clear();
                      _descriptionETController.clear();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Registration Success")));
                    } else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Registration Fail")));
                    }
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavigationScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
