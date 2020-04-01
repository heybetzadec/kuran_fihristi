import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class VersesByWord extends StatefulWidget {
  final RouteBus routeBus;

  VersesByWord({Key key, this.routeBus}) : super(key: key);

  @override
  _VersesByWordState createState() => _VersesByWordState(routeBus);
}

class _VersesByWordState extends State<VersesByWord> {
  final RouteBus routeBus;

  _VersesByWordState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
