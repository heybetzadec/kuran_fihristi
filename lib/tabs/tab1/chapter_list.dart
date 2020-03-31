import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/tabs/tab1/verse_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class ChapterList extends StatefulWidget {
  final RouteBus routeBus;

  ChapterList({Key key, this.routeBus}) : super(key: key);

  @override
  _ChapterListState createState() => _ChapterListState(routeBus);
}

class _ChapterListState extends State<ChapterList> {
  final RouteBus routeBus;

  _ChapterListState(this.routeBus);




  @override
  void initState() {
    routeBus.dbf.then((db) {
      db.rawQuery("SELECT name FROM sqlite_master  WHERE type IN ('table','view') AND name NOT LIKE 'sqlite_%' UNION ALL SELECT name FROM sqlite_temp_master  WHERE type IN ('table','view') ORDER BY 1;").then((value) {
        for (var val in value) {
          print("val = $val");
        }
        print('value = $value');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return VerseList();
                }));
              },
              child: Text(
                'Clcik'
              )
          ),
        ),
      ),
    );
  }

}
