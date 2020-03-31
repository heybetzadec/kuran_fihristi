import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class NameList extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  NameList({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _NameListState createState() => _NameListState(onPush, eventBus);
}

class _NameListState extends State<NameList> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _NameListState(this.onPush, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
