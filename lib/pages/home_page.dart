import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:headaky/models/activity.dart';

import 'package:headaky/models/feel.dart';

import 'package:headaky/models/food.dart';
import 'package:headaky/pages/feels_list_page.dart';
import 'package:headaky/pages/home_page_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String feel;
  String image;
  String datepicked;
  String timepicked;
  String datetime;
  int currentindex;
  int ontapcount = 0;

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
    Food('assets/doces.png', 'Doces', false),
    Food('assets/fast-food.png', 'Fast Food', false),
    Food('assets/frituras.png', 'Frituras', false),
    Food('assets/frutas.png', 'Frutas', false),
    Food('assets/paes.png', 'Pães', false),
    Food('assets/alcool.png', 'alcool', false),
  ];

  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Headaky - Diário',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: page == 0 ? HomePageBody() : FeelsListPage(),
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          // color: Colors.red,
          backgroundColor: Colors.greenAccent,
          // buttonBackgroundColor: Colors.greenAccent,
          animationCurve: Curves.easeInBack,
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          items: <Widget>[
            Icon(
              Icons.home,
              size: 18,
            ),
            Icon(
              Icons.list,
              size: 18,
            )
          ]),
      // body: Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: Column(
      //     children: [
      //       Text('O que você tem sentido?', style: TextStyle(fontSize: 22)),
      //       SizedBox(height: 20),
      //       Container(
      //           height: MediaQuery.of(context).size.height * 0.1,
      //           width: MediaQuery.of(context).size.width,
      //           child: ListView.builder(
      //               scrollDirection: Axis.horizontal,
      //               itemCount: feels.length,
      //               itemBuilder: (context, index) {
      //                 return Row(
      //                   children: [
      //                     SizedBox(
      //                       width: 15,
      //                     ),
      //                     GestureDetector(
      //                       onTap: () {
      //                         if (ontapcount == 0) {
      //                           setState(() {
      //                             feel = feels[index].name;
      //                             image = feels[index].feelimage;
      //                             feels[index].iselected = true;
      //                             ontapcount += 1;
      //                             print(feel);
      //                           });
      //                         } else if (feels[index].iselected) {
      //                           setState(() {
      //                             feels[index].iselected = false;
      //                             ontapcount = 0;
      //                           });
      //                         } else if (ontapcount != 0) {
      //                           for (var i = 0; i < feels.length; i++) {
      //                             setState(() {
      //                               feels[i].iselected = false;
      //                             });
      //                           }
      //                           feel = feels[index].name;
      //                           image = feels[index].feelimage;
      //                           feels[index].iselected = true;
      //                           ontapcount += 1;
      //                           print(feel);
      //                         }
      //                       },
      //                       child: FeelIcon(
      //                           feels[index].feelimage,
      //                           feels[index].name,
      //                           feels[index].iselected
      //                               ? Colors.greenAccent
      //                               : Colors.transparent),
      //                     ),
      //                   ],
      //                 );
      //               })),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Text('O que você tem feito?', style: TextStyle(fontSize: 22)),
      //       SizedBox(height: 10),
      //       Container(
      //         height: MediaQuery.of(context).size.height * 0.1,
      //         width: MediaQuery.of(context).size.width,
      //         child: ListView.builder(
      //             scrollDirection: Axis.horizontal,
      //             itemCount: activities.length,
      //             itemBuilder: (context, index) {
      //               return Row(
      //                 children: [
      //                   SizedBox(
      //                     width: 15,
      //                   ),
      //                   GestureDetector(
      //                     child: ActivityIcon(
      //                         activities[index].image,
      //                         activities[index].name,
      //                         activities[index].selected
      //                             ? Colors.greenAccent
      //                             : Colors.transparent),
      //                     onTap: () {
      //                       if (activities[index].selected) {
      //                         setState(() {
      //                           activities[index].selected = false;
      //                         });
      //                       } else {
      //                         setState(() {
      //                           activities[index].selected = true;
      //                           // Provider.of<FeelCard>(context, listen: false)
      //                           //     .addActivity(activities[index]);
      //                         });
      //                       }
      //                     },
      //                   ),
      //                 ],
      //               );
      //             }),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
