// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, unused_element

import 'dart:ui';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zodiac/Pages/resultPage.dart';
import 'package:zodiac/assets/colors.dart';
import 'package:zodiac/assets/textstyle.dart';
import 'package:zodiac/data/zodiac.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentDate = DateTime.now();
  final userNameController = TextEditingController();

  late String userName = ' ';
  _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }

    // ignore: avoid_print
    print(currentDate);
  }

  getZodiacSign(DateTime currentDate) {
    var day = currentDate.day;
    var month = currentDate.month;

    if ((month == 1 && day <= 20) || (month == 12 && day >= 22)) {
      return 10;
    } else if ((month == 1 && day >= 21) || (month == 2 && day <= 18)) {
      return 11;
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return 12;
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 20)) {
      return 1;
    } else if ((month == 4 && day >= 21) || (month == 5 && day <= 20)) {
      return 2;
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return 3;
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return 4;
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 23)) {
      return 5;
    } else if ((month == 8 && day >= 24) || (month == 9 && day <= 23)) {
      return 6;
    } else if ((month == 9 && day >= 24) || (month == 10 && day <= 23)) {
      return 7;
    } else if ((month == 10 && day >= 24) || (month == 11 && day <= 22)) {
      return 8;
    } else if ((month == 11 && day >= 23) || (month == 12 && day <= 21)) {
      return 9;
    } else {
      return 0;
    }
  }

  _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            backgroundColor: blue,
            title: const Text(
              "Hey! What's your ... ",
              style: normal,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        userName = text;
                      });
                      // ignore: avoid_print
                      print('First text field: $text');
                    },
                    cursorColor: white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text('Your Name'),
                      labelStyle: normal,
                      fillColor: white,
                      hoverColor: white,
                      focusColor: white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 250,
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle:
                              TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: currentDate,
                        minimumDate: DateTime(1947),
                        maximumDate: DateTime(2030),
                        onDateTimeChanged: (newDate) {
                          setState(() {
                            currentDate = newDate;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                            zodiacValue: getZodiacSign(currentDate),
                            userName: userName.toString())),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: Text("Whats's your sign?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    )),
                background: Container(
                    color: blue,
                    child: Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 10), child: null
                            // Lottie.asset('assets/lott.json',
                            // height: double.infinity),

                            ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        'Hola!',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 55,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Welcome!',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Lottie.asset('assets/moon.json',
                                      height: 200, width: 200),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      color: blue,
                      child: SizedBox(
                        height: 0,
                      )),
                  SizedBox(
                    height: 50,
                    child: Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: zodiacList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  zodiacList[index]['zodiacImage'],
                                  fit: BoxFit.cover,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              Text(
                                zodiacList[index]['zodiacName'],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                zodiacList[index]['zodiacDate'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: _showMyDialog,
                      child: Text('EXPLORE'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
