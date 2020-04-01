import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/base_app_bar.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class WordList extends StatefulWidget {
  final RouteBus routeBus;
  final int letterId;

  WordList({Key key, this.routeBus, this.letterId}) : super(key: key);

  @override
  _WordListState createState() => _WordListState(routeBus, letterId);
}

class _WordListState extends State<WordList> {
  final RouteBus routeBus;
  final int letterId;

  _WordListState(this.routeBus, this.letterId);

  var dataList = new List<Map<String, dynamic>>();

  @override
  void initState() {
    routeBus.dbf.then((db) {
      db
          .rawQuery(
          "SELECT WordID, WordName FROM Word WHERE LangID=${routeBus.languageId} AND LetterID = $letterId;")
          .then((value) {
        setState(() {
          dataList = value.toList();
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Sura',
        appBar: AppBar(),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 2),
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            var itemValue = dataList[index].values;
            return new Card(
              margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              elevation: 1,
              child: new InkWell(
                onTap: () {
                  print('on tap');
                },
                child: ListTile(
                  title: Text('${itemValue.last}'),
                ),
              ),
//                color: Colors.transparent,
            );
          },
        ),
      ),
    );
  }
}
