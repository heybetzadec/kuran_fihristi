import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class WordList extends StatefulWidget {
  final RouteBus routeBus;

  WordList({Key key, this.routeBus}) : super(key: key);

  @override
  _WordListState createState() => _WordListState(routeBus);
}

class _WordListState extends State<WordList> {
  final RouteBus routeBus;

  _WordListState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
