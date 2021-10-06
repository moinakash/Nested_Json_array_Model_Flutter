import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/main_product_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

Future<MainProductModel> getPosts2() async {
  var apiUrl = Uri.parse(
      'https://script.googleusercontent.com/macros/echo?user_content_key=8Dq27ZKx2uo3sHyrJl9u1l--dpguE9nMQAyekQvFJ9OhtGjuTr1U5S-wZitOCDPIW63Vz_5IaZAFGjByOCZw_o6K1Bb4HxxtOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHa1GhPSVukpSQTydEwAEXFXgt_wltjJcH3XHUaaPC1fv5o9XyvOto09QuWI89K6KjOu0SP2F-BdwUh7dajWPvZd-bmx2H_66tfTwtNP8DvCKitafJxwa464MRkfpDutQTocCJ59mz8_6tvl7IGsXAM8lUdx0plUaXVQ&lib=MnrE7b2I2PjfH799VodkCPiQjIVyBAxva');

  final response =
      await http.get(apiUrl, headers: {"Accept": "application/json"});

  final dynamic jsonResponse = json.decode(response.body);
  final MainProductModel responseModel =
      MainProductModel.fromJson(jsonResponse);

  print(
      "======${responseModel.products[0].subText}----${responseModel.products[0].title}");

  print("done");

  return responseModel;
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      // Future<MainProductModel> dd = getPosts2();
      //
      // print(getPosts2());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: FutureBuilder<MainProductModel>(
            future: getPosts2(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => MyCardList(
                          id: "${snapshot.data?.products[index].bgStatus}",
                          title: "${snapshot.data?.products[index].title}",
                          dec: "${snapshot.data?.products[index].subText}")),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyCardList extends StatefulWidget {
  final String id;
  final String title;
  final String dec;

  //final Function function;

  MyCardList({
    required this.id,
    required this.title,
    required this.dec,
  });

  //const MyCardList({Key? key}) : super(key: key);

  @override
  _MyCardListState createState() => _MyCardListState();
}

class _MyCardListState extends State<MyCardList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: widget.id == "0"? AssetImage('assets/images/kala.jpg'):AssetImage('assets/images/lal.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      margin: EdgeInsets.all(20),
      //color: widget.id == "0" ? Colors.deepOrange : Colors.blue,
      child: Column(
        children: [
          Text(widget.id),
          Text(widget.title),
          Text(widget.dec),
        ],
      ),
    );
  }
}
