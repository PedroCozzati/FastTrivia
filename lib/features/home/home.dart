import 'package:fasttrivia1/common/colors.dart';
import 'package:fasttrivia1/common/sizes.dart';
import 'package:fasttrivia1/features/home/widgets/quiz_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;
  final String result;

  const Home({super.key, required this.title, required this.result});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AppSizes sizes = AppSizes(context: context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        toolbarHeight: sizes.height / 8,
        title: Text(
          "Fast Trivia",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
            height: sizes.height,
            child: Column(children: [
              Text("Questionários respondidos:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColors.darkblue),),
              Expanded(
                child: GridView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2,
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: QuizCard(
                          title: widget.title,
                          result: widget.result,
                          image: 'image',
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    onPrimary: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(sizes.height, 60), //////// HERE
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'quiz');
                  },
                  child: Text(
                    'Iniciar novo questionário',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
              // fill in required params
            ])),
      ),
    );
  }
}
