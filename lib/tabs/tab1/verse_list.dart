import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class VerseList extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  VerseList({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _VerseListState createState() => _VerseListState(onPush, eventBus);
}

class _VerseListState extends State<VerseList> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _VerseListState(this.onPush, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
