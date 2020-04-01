import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class VersesByTheme extends StatefulWidget {
  final RouteBus routeBus;

  VersesByTheme({Key key, this.routeBus}) : super(key: key);

  @override
  _VersesByThemeState createState() => _VersesByThemeState(routeBus);
}

class _VersesByThemeState extends State<VersesByTheme> {
  final RouteBus routeBus;

  _VersesByThemeState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
