import 'package:flutter/material.dart';
import '../utils/text_style.dart';

class CardListViewWidget extends StatelessWidget {
  const CardListViewWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Head Text For Checck", style: head1TextStyle,),
              const SizedBox(height: 8,),
              const Text("A sign in attempt requires further verification because we did not recognize your device. To complete the sign in, enter the verification code on the unrecognized device."),
              const SizedBox(height: 4,),
              const Text("date"),
              const SizedBox(height: 8,),
              Row(
                children: [
                  const Chip(label: Text("New")),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                  const SizedBox(width: 8,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
