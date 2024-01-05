import 'package:flutter/material.dart';
import 'package:task_project/api/auth_utils.dart';
import 'package:task_project/ui/screen/auth/login_screen.dart';
import 'package:task_project/ui/screen/auth/profileupdate_screen.dart';
import 'package:task_project/ui/utils/apps_colors.dart';

AppBar taskAppBar (BuildContext context){
  return AppBar(
    backgroundColor: primaryColor,
    automaticallyImplyLeading: false,
    flexibleSpace: Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUpdateScreen()));
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ClipOval(
                  child: Image.asset("assets/images/zan.jpg"),),
            ),
          ),
        ),
       const SizedBox(width: 8,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('${AuthUtils.firstName ?? ''} " " ${AuthUtils.lastName ?? ''}' , style: TextStyle(color: Colors.white),),
            Text(AuthUtils.email ?? 'Unknown', style: TextStyle(color: Colors.white),),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: (){
            AuthUtils.clearData();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
        },
          icon: const Icon(Icons.logout_rounded, color: Colors.white,),),
      ],
    ),
  );
}