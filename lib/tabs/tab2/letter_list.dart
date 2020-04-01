import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class LetterList extends StatefulWidget {
  final RouteBus routeBus;

  LetterList({Key key, this.routeBus}) : super(key: key);

  @override
  _LetterListState createState() => _LetterListState(routeBus);
}

class _LetterListState extends State<LetterList> {
  final RouteBus routeBus;

  _LetterListState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
