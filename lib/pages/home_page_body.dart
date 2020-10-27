import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:headaky/db/db_helper.dart';
import 'package:headaky/models/activity.dart';
import 'package:headaky/models/activity_icon.dart';
import 'package:headaky/models/feel.dart';

import 'package:headaky/models/feel_icon.dart';
import 'package:headaky/models/food.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String feel;

  String image;

  String datepicked;

  String timepicked;

  String datetime;

  int currentindex;

  int ontapcount = 0;

  List<String> activityNames = [];
  List<String> activityImages = [];
  List<String> foodNames = [];
  List<String> foodImages = [];
  String animationName = 'xx';

  List<Activity> activities = [
    Activity('assets/dogplay.png', 'Brincando', false),
    Activity('assets/gaming.png', 'Jogando', false),
    Activity('assets/listening.png', 'Música ', false),
    Activity('assets/reading.png', 'Lendo', false),
    Activity('assets/tv.png', 'Filmes', false),
    Activity('assets/workout.png', 'Exercícios', false),
    Activity('assets/instrument.png', 'Tocando', false),
    Activity('assets/cellphone.png', 'Celular', false),
  ];

  List<Feel> feels = [
    Feel('assets/otimo.png', 'Muito bem', false),
    Feel('assets/bem.png', 'Bem', false),
    Feel('assets/mal.png', 'Mal', false),
    Feel('assets/enjoo.png', 'Enjoo', false),
    Feel('assets/irritacao.png', 'Irritação', false),
    Feel('assets/muito-mal.png', 'Muito Mal', false),
  ];

  List<Food> foods = [
    Food('assets/carnes.png', 'Carnes', false),
    Food('assets/frituras.png', 'Frituras', false),
    Food('assets/frutas.png', 'Frutas', false),
    Food('assets/paes.png', 'Pães', false),
    Food('assets/alcool.png', 'Álcool', false),
    Food('assets/doces.png', 'Doces', false),
    Food('assets/fast-food.png', 'Fast Food', false),
  ];
  final snackBar = SnackBar(
    content: Text('Sentimento adicionado com sucesso'),
    backgroundColor: Colors.green,
  );
  final snackBarErroSentimento = SnackBar(
    content: Text('Você deve inserir um sentimento'),
    backgroundColor: Colors.red,
  );
  final snackBarErroAtividade = SnackBar(
    content: Text('Você deve inserir uma atividade'),
    backgroundColor: Colors.red,
  );
  final snackBarErroComida = SnackBar(
    content: Text('Você deve inserir um alimento'),
    backgroundColor: Colors.red,
  );

  animateCheckButton() {
    setState(() {
      animationName = animationName == 'Untitled' ? '' : 'Untitled';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 15,
          ),
          Text('O que você tem sentido?', style: TextStyle(fontSize: 22)),
          SizedBox(height: 20),
          Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: feels.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (ontapcount == 0) {
                            setState(() {
                              feel = feels[index].name;
                              image = feels[index].feelimage;
                              feels[index].iselected = true;
                              ontapcount += 1;
                              print(feel);
                            });
                          } else if (feels[index].iselected) {
                            setState(() {
                              feels[index].iselected = false;
                              ontapcount = 0;
                            });
                          } else if (ontapcount != 0) {
                            for (var i = 0; i < feels.length; i++) {
                              setState(() {
                                feels[i].iselected = false;
                              });
                            }
                            feel = feels[index].name;
                            image = feels[index].feelimage;
                            feels[index].iselected = true;
                            ontapcount += 1;
                            print(feel);
                          }
                        },
                        child: FeelIcon(
                            feels[index].feelimage,
                            feels[index].name,
                            feels[index].iselected
                                ? Colors.greenAccent
                                : Colors.transparent),
                      ),
                    ],
                  );
                },
              )),
          SizedBox(
            height: 40,
          ),
          Text('O que você tem feito?', style: TextStyle(fontSize: 22)),
          Text('(Você pode selecionar mais de um neste)',
              style: TextStyle(fontSize: 12)),
          SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: ActivityIcon(
                            activities[index].image,
                            activities[index].name,
                            activities[index].selected
                                ? Colors.greenAccent
                                : Colors.transparent),
                        onTap: () {
                          if (activities[index].selected) {
                            setState(() {
                              activities[index].selected = false;
                              activityImages.remove(activities[index].image);
                              activityNames.remove(activities[index].name);
                              print(activityNames.join('-'));
                            });
                          } else {
                            setState(() {
                              activities[index].selected = true;
                              activityImages.add(activities[index].image);
                              activityNames.add(activities[index].name);
                              print(activityNames.join('-'));
                            });
                          }
                        },
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(height: 40),
          Text('O que você tem comido?', style: TextStyle(fontSize: 22)),
          Text('(Você pode selecionar mais de um neste)',
              style: TextStyle(fontSize: 12)),
          SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foods.length,
                itemBuilder: (_, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (foods[index].selected) {
                            setState(() {
                              foods[index].selected = false;
                              foodNames.remove(foods[index].name);
                              foodImages.remove(foods[index].image);
                              print(foodNames);
                            });
                          } else {
                            setState(() {
                              foods[index].selected = true;
                              foodNames.add(foods[index].name);
                              foodImages.add(foods[index].image);
                              print(foodNames.join('-'));
                            });
                          }
                        },
                        child: FeelIcon(
                            foods[index].image,
                            foods[index].name,
                            foods[index].selected
                                ? Colors.greenAccent
                                : Colors.transparent),
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: FlatButton(
                onPressed: () {
                  if (feel != null &&
                      activityNames.length >= 1 &&
                      foodNames.length >= 1) {
                    DBHelper.insertFeel('user_feels', {
                      // 'id': '',
                      'datetime': DateTime.now().toString().substring(0, 10),
                      'feel': feel,
                      'image': image,
                      'actimage': activityImages.join('-'),
                      'actname': activityNames.join('-'),
                      'foodimage': foodImages.join('-'),
                      'foodname': foodNames.join('-'),
                      'date': DateTime.now().toString()
                    }).then((value) {
                      Scaffold.of(context).showSnackBar(snackBar);
                      // Navigator.of(context).pushNamed('/feels');
                    });
                  } else if (feel == null) {
                    Scaffold.of(context).showSnackBar(snackBarErroSentimento);
                  } else if (activityNames.length < 1) {
                    Scaffold.of(context).showSnackBar(snackBarErroAtividade);
                  } else if (foodNames.length < 1) {
                    Scaffold.of(context).showSnackBar(snackBarErroComida);
                  }
                },
                child: Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.green, fontSize: 20),
                )),
          ),
          // FlatButton(
          //     onPressed: () {
          //       print(DBHelper.getData('user_feels'));
          //       Navigator.of(context).pushNamed('/feels');
          //     },
          //     child: Text(
          //       'SHOW ALL',
          //       style: TextStyle(color: Colors.green, fontSize: 20),
          //     )),
        ],
      ),
    );
  }
}
