// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zodiac/assets/colors.dart';
import 'package:zodiac/assets/textstyle.dart';
import 'package:zodiac/data/zodiac.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key, required this.userName, required this.zodiacValue})
      : super(key: key);
  final String userName;
  final int zodiacValue;

  @override
  Widget build(BuildContext context) {
    var index = zodiacValue - 1;
    var zodiacName = zodiacList[index]["zodiacName"];
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: blue,
        appBar: AppBar(
          title: const Text('Back'),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              height: queryData.size.height,
              width: queryData.size.width,
              child: Lottie.asset(
                'assets/lott2.json',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.grey.withAlpha(80),
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 50.0,
                              foregroundColor: Colors.black,
                              backgroundColor: white,
                              backgroundImage:
                                  AssetImage(zodiacList[index]['zodiacImage']),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                zodiacList[index]['zodiacName'],
                                style: TextStyle(
                                    fontSize: 25,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                zodiacList[index]['zodiacDate'],
                                style: TextStyle(fontSize: 18, color: white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(zodiacList[index]['zodiacSubName'],
                                style: TextStyle(
                                    color: white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            Text('Symbol',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 18,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Text(zodiacList[index]['zodiacElement'],
                                style: TextStyle(
                                    color: white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            Text('Element',
                                style: TextStyle(color: white, fontSize: 18))
                          ],
                        ),
                        Column(
                          children: [
                            Text(zodiacList[index]['zodiacPlanet'],
                                style: TextStyle(
                                    color: white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            Text('Planet',
                                style: TextStyle(color: white, fontSize: 18))
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text('Hello! $userName',
                              style: TextStyle(color: white, fontSize: 25)),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            zodiacList[index]['zodiacAbout'],
                            style: normal,
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
