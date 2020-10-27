import 'package:flutter/material.dart';
import 'package:headaky/db/db_helper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:headaky/models/activity_icon.dart';
import 'package:headaky/models/feel_icon.dart';

class FeelsListPage extends StatefulWidget {
  @override
  _FeelsListPageState createState() => _FeelsListPageState();
}

class _FeelsListPageState extends State<FeelsListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<List>(
          stream: DBHelper.getData('user_feels').asStream(),
          initialData: List(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data.isEmpty) {
              return Center(
                  child: Text(
                      'Parece que você ainda não salvou nenhum sentimento'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    List<String> actImageList =
                        snapshot.data[index]['actimage'].toString().split('-');
                    List<String> foodImageList =
                        snapshot.data[index]['foodimage'].toString().split('-');
                    List<String> actNameList =
                        snapshot.data[index]['actname'].toString().split('-');
                    var foodNameList =
                        snapshot.data[index]['foodname'].toString().split('-');
                    var dateTime = snapshot.data[index]['datetime'];
                    var feel = snapshot.data[index]['feel'];
                    var image = snapshot.data[index]['image'];
                    print(snapshot.data[index]['id']);
                    // String dateTimeMesExtenso = 'asd';
                    // if (dateTime.toString().substring(5, 8) == '01')
                    //   dateTimeMesExtenso = 'Janeiro';
                    // if (dateTime.toString().substring(5, 8) == '02')
                    //   dateTimeMesExtenso = 'Fevereiro';
                    // if (dateTime.toString().substring(5, 8) == '03')
                    //   dateTimeMesExtenso = 'Março';
                    // if (dateTime.toString().substring(5, 8) == '04')
                    //   dateTimeMesExtenso = 'Abril';
                    // if (dateTime.toString().substring(5, 8) == '05')
                    //   dateTimeMesExtenso = 'Maio';
                    // if (dateTime.toString().substring(5, 8) == '06')
                    //   dateTimeMesExtenso = 'Junho';
                    // if (dateTime.toString().substring(5, 8) == '07')
                    //   dateTimeMesExtenso = 'Julho';
                    // if (dateTime.toString().substring(5, 8) == '08')
                    //   dateTimeMesExtenso = 'Agosto';
                    // if (dateTime.toString().substring(5, 8) == '09')
                    //   dateTimeMesExtenso = 'Setembro';
                    // if (dateTime.toString().substring(5, 8) == '10')
                    //   print('AAAAAAAAAAAAAAAAAAAAAAAAAA');
                    // if (dateTime.toString().substring(5, 8) == '11')
                    //   dateTimeMesExtenso = 'Novembro';
                    // if (dateTime.toString().substring(5, 8) == '12')
                    //   dateTimeMesExtenso = 'Dezembro';
                    print(snapshot.data);
                    print(snapshot.data.length);

                    // List<String> actImages = actImageString.split('-');
                    // List<String> foodImages = foodImageString.split('-');
                    return Slidable(
                      child: GestureDetector(
                        onTap: () {
                          print(snapshot.data[index]['id']);
                        },
                        onLongPress: () {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Deseja excluir este sentimento?'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  DBHelper.delete(snapshot
                                                      .data[index]['id']);
                                                });
                                                // DBHelper.deleteNew(dateTime);
                                              },
                                              child: Text(
                                                'Sim',
                                                style: TextStyle(
                                                    color: Colors.redAccent),
                                              ),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Não',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.greenAccent)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Card(
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    // color: Colors.red,
                                    width: MediaQuery.of(context).size.width *
                                        0.33,
                                    child: FeelIcon(
                                        image, feel, Colors.transparent)),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  // color: Colors.blue,
                                  child: Text('Data: ' +
                                      dateTime.toString().substring(8, 10) +
                                      '/' +
                                      dateTime.toString().substring(5, 7) +
                                      '/' +
                                      dateTime.toString().substring(0, 4)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      actionPane: SlidableBehindActionPane(),
                      actions: [
                        IconSlideAction(
                          icon: Icons.delete_forever,
                          caption: 'Excluir',
                          color: Colors.white,
                          onTap: () {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              'Deseja excluir este sentimento?'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FlatButton(
                                                onPressed: () {
                                                  setState(() {
                                                    DBHelper.delete(snapshot
                                                            .data[index]['id'])
                                                        .then((value) =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop());
                                                    //TODO: .THEN(SHOWSNACKBAR)
                                                  });
                                                  // DBHelper.deleteNew(dateTime);
                                                },
                                                child: Text(
                                                  'Sim',
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                ),
                                              ),
                                              FlatButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Não',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .greenAccent)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ],
                      secondaryActions: [
                        IconSlideAction(
                            icon: Icons.more_horiz,
                            color: Colors.white,
                            caption: 'Informações',
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Center(
                                          child: Text('Mais Informações')),
                                      content: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Text(
                                            //   'Data: ' +
                                            //       (snapshot.data[index]
                                            //               ['datetime']
                                            //           .toString()),
                                            //   style: TextStyle(fontSize: 18),
                                            // ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10)),
                                            Text(
                                              'O que você fez: ',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10)),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 100,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: actNameList.length,
                                                  itemBuilder: (_, index) {
                                                    return ActivityIcon(
                                                        actImageList[index],
                                                        actNameList[index],
                                                        Colors.transparent);
                                                  }),
                                            ),
                                            Text(
                                              'O que você comeu: ',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10)),
                                            Container(
                                              height: 100,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      foodNameList.length,
                                                  itemBuilder: (_, index) {
                                                    return ActivityIcon(
                                                        foodImageList[index],
                                                        foodNameList[index],
                                                        Colors.transparent);
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                    )))
                      ],
                    );
                  });
            }
          }),
    );
  }
}
