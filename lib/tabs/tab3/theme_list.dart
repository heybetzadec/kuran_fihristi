import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class ThemeList extends StatefulWidget {
  final RouteBus routeBus;

  ThemeList({Key key, this.routeBus}) : super(key: key);

  @override
  _ThemeListState createState() => _ThemeListState(routeBus);
}

class _ThemeListState extends State<ThemeList> {
  final RouteBus routeBus;

  _ThemeListState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
