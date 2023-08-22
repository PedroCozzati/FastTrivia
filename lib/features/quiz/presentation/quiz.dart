import 'dart:convert';

import 'package:fasttrivia1/common/sizes.dart';
import 'package:fasttrivia1/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/colors.dart';

class Quiz extends StatefulWidget {

  Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var quizData = {};

  @override
  initState()  {
    super.initState();
    readJson();


  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/test_json.json');
    final data = await json.decode(response);
    setState(() {
      quizData = data['questionario'];
    });
  }

  void _getData() async {
    setState(() async {
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSizes sizes = AppSizes(context: context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: sizes.height / 8,
        title: Text(
          quizData['titulo'],
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
      ),
      body:  Container(
                child: RawScrollbar(
                  thumbColor: AppColors.mainColor,
                  radius: Radius.circular(20),
                  thickness: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: quizData['questoes'].length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: false,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SizedBox(
                                    height: sizes.height / 2,
                                    width: sizes.width,
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                      Text(
                                        quizData['questoes'][index]['titulo'],
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkblue),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          quizData['questoes'][index]['pergunta'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.darkblue),
                                        ),
                                      ),
                                      Expanded(
                                        child: GridView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: quizData['questoes'][index]['alternativas'].length,
                                            scrollDirection: Axis.vertical,
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 5,
                                              crossAxisCount: 1,
                                            ),
                                            itemBuilder: (context, altIndex) {
                                              return Padding(
                                                  padding: const EdgeInsets.all(18.0),
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                                        builder: (context) {
                                                          return Home(
                                                            title: quizData['titulo']??'',
                                                            result: '9/10',
                                                          );
                                                        },
                                                      ));

                                                    },
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.all(10.0),
                                                        child: Text(quizData['questoes'][index]['alternativas'][altIndex]['titulo']),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            width: 1,
                                                            color: AppColors.darkblue,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(20)),
                                                    ),
                                                  ));
                                            }),
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      )
                                    ])),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            onPrimary: Colors.white,
                            shadowColor: Colors.black,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(230, 50), //////// HERE
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) {
                                return Home(
                                  title: quizData['titulo']??'',
                                  result: '9/10',
                                );
                              },
                            ));
                          },
                          child: Text(
                            'Enviar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
    );
  }
}
