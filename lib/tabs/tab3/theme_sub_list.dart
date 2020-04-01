import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class ThemeSubList extends StatefulWidget {
  final RouteBus routeBus;

  ThemeSubList({Key key, this.routeBus}) : super(key: key);

  @override
  _ThemeSubListState createState() => _ThemeSubListState(routeBus);
}

class _ThemeSubListState extends State<ThemeSubList> {
  final RouteBus routeBus;

  _ThemeSubListState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
