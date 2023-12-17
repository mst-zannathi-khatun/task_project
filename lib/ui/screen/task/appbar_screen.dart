import 'package:flutter/material.dart';

AppBar TaskAppBar (){
  return AppBar(
    flexibleSpace: Container(
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(

            ),
          ),
          Column(
            children: const [
              Text("First Name"),
              Text("Last Name"),
            ],
          ),
        ],
      ),
    ),
  );
}