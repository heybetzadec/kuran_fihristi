import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
