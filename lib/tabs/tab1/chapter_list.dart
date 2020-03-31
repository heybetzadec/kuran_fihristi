import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ChapterList extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  ChapterList({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _ChapterListState createState() => _ChapterListState(onPush, eventBus);
}

class _ChapterListState extends State<ChapterList> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _ChapterListState(this.onPush, this.eventBus);


  Future<void> getDatabase() async {
    var databasesPath = await getDatabasesPath();
    print('databasesPath=$databasesPath');
//    String path = join(databasesPath, 'demo.db');
  }

  @override
  void initState() {
    print('chapter');
    getDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}
