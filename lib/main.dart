import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matching game',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Matching game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> orderList = [
    'Grimm',
    'Grimm',
    'Hornet',
    'Hornet',
    'Knight',
    'Knight',
    'Pale_King',
    'Pale_King',
    'Pure_Vessel',
    'Pure_Vessel',
    'Shade_Beast',
    'Shade_Beast',
    'Stag',
    'Stag',
    'White_Lady',
    'White_Lady'
  ];
  List<bool> showList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  String firstPic = 'None';
  String secondPic = 'None';
  int firstOrd = -1;
  int secondOrd = -1;
  bool idontknow = true;
  int attempt = 0;
  bool finished=false;

  void justClick(pic, order) {
    if (firstPic == 'None') {
      firstPic = pic;
      firstOrd = order;
    } else {
      attempt += 1;
      secondPic = pic;
      secondOrd = order;
      setState(() {
        if (firstPic == secondPic) {
        } else {
          showList[firstOrd] = false;
          showList[secondOrd] = false;
        }
        firstPic = 'None';
        secondPic = 'None';
        if (!showList.contains(false)){
          finished=true;
        }
      });
    }
  }

  Widget matchingCard(order, word, showList) {
    return GestureDetector(
        onTap: () {
          if (!showList[order]) {
            setState(() {
              showList[order] = true;
            });

            justClick(word, order);
            Alert(
              context: context,
              image: Image.asset("images/$word.webp"),
            ).show();
          }
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage((showList[order])
                      ? 'images/$word.webp'
                      : 'images/hollowknight.webp'),
                  fit: BoxFit.cover)),
          height: 136,
          width: 102,
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (idontknow) {
      orderList.shuffle();
      idontknow = !idontknow;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Matching Game - Hollow Knight'),
      ),
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/black.webp'),
                      fit: BoxFit.cover)),
              height: 1000,
              width: 800,
              child: Column(
                children: [
                  Row(
                    children: [
                      matchingCard(0, orderList[0], showList),
                      matchingCard(1, orderList[1], showList),
                      matchingCard(2, orderList[2], showList),
                      matchingCard(3, orderList[3], showList),
                    ],
                  ),
                  Row(
                    children: [
                      matchingCard(4, orderList[4], showList),
                      matchingCard(5, orderList[5], showList),
                      matchingCard(6, orderList[6], showList),
                      matchingCard(7, orderList[7], showList),
                    ],
                  ),
                  Row(
                    children: [
                      matchingCard(8, orderList[8], showList),
                      matchingCard(9, orderList[9], showList),
                      matchingCard(10, orderList[10], showList),
                      matchingCard(11, orderList[11], showList),
                    ],
                  ),
                  Row(
                    children: [
                      matchingCard(12, orderList[12], showList),
                      matchingCard(13, orderList[13], showList),
                      matchingCard(14, orderList[14], showList),
                      matchingCard(15, orderList[15], showList),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 100),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.amberAccent.shade100),
                        height: 30,
                        width: 200,
                        alignment: Alignment.center,
                        child: Text(
                          'Attempt : $attempt',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      SizedBox(width: 15),
                      if (finished)...[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              orderList = [
                                'Grimm',
                                'Grimm',
                                'Hornet',
                                'Hornet',
                                'Knight',
                                'Knight',
                                'Pale_King',
                                'Pale_King',
                                'Pure_Vessel',
                                'Pure_Vessel',
                                'Shade_Beast',
                                'Shade_Beast',
                                'Stag',
                                'Stag',
                                'White_Lady',
                                'White_Lady'
                              ];
                              orderList.shuffle();
                              showList = [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ];
                              firstPic = 'None';
                              secondPic = 'None';
                              firstOrd = -1;
                              secondOrd = -1;
                              idontknow = true;
                              attempt = 0;
                              finished=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                color: Colors.amberAccent.shade100),
                            height: 30,
                            width: 90,
                            alignment: Alignment.center,
                            child: Text(
                              'Restart',
                              style: TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        )
                      ]



                    ],
                  )
                ],
              ))),
    );
  }
}
