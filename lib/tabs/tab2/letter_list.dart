import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class LetterList extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  LetterList({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _LetterListState createState() => _LetterListState(onPush, eventBus);
}

class _LetterListState extends State<LetterList> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _LetterListState(this.onPush, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
