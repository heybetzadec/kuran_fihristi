import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';
import 'package:sqflite/sqflite.dart';

class VerseList extends StatefulWidget {
  final Database db;
  final EventBus eventBus;

  VerseList({Key key, this.db, this.eventBus}) : super(key: key);

  @override
  _VerseListState createState() => _VerseListState(db, eventBus);
}

class _VerseListState extends State<VerseList> {
  final Database db;
  final EventBus eventBus;

  _VerseListState(this.db, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
