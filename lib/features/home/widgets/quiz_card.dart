import 'package:flutter/material.dart';

import '../../../common/colors.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String result;
  final String image;

  const QuizCard(
      {super.key,
      required this.title,
      required this.result,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.darkblue, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.darkblue,
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: AppColors.mainColor,
            ),
            child: Center(child: Text(title,style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold
            ),)),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.white,
            child: Center(child: Text("Concluído")),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Container(
              child: Center(child: Text(result,style: TextStyle(
                color: Colors.white
              ),)),
            ),
          )
        ],
      ),
    );
  }
}
