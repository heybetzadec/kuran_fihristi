import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class WordList extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  WordList({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _WordListState createState() => _WordListState(onPush);

}

class _WordListState extends State<WordList> {
  final ValueChanged<ForRoute> onPush;

  _WordListState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
