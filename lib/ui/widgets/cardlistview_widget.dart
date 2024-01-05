import 'package:flutter/material.dart';
import '../utils/text_style.dart';

class CardListViewWidget extends StatelessWidget {
  const CardListViewWidget({
    Key? key, required this.headText, required this.descriptions, required this.date, required this.type, required this.onEditPressed, required this.onDeletePressed,
  }) : super(key: key);

  final String headText, descriptions, date, type;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(headText, style: head1TextStyle,),
              const SizedBox(height: 8,),
              Text(descriptions),
              const SizedBox(height: 4,),
               Text(date),
              const SizedBox(height: 8,),
              Expanded(
                child: Row(
                  children: [
                    Chip(label: Text(type)),
                    const Spacer(),
                    IconButton(onPressed: onEditPressed, icon: const Icon(Icons.edit)),
                    const SizedBox(width: 8,),
                    IconButton(onPressed: onDeletePressed, icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
