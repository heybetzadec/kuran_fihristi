import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class NameList extends StatefulWidget {
  final RouteBus routeBus;

  NameList({Key key, this.routeBus}) : super(key: key);

  @override
  _NameListState createState() => _NameListState(routeBus);
}

class _NameListState extends State<NameList> {
  final RouteBus routeBus;

  _NameListState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
