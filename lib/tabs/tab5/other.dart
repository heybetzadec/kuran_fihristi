import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class Other extends StatefulWidget {
  final RouteBus routeBus;

  Other({Key key, this.routeBus}) : super(key: key);

  @override
  _OtherState createState() => _OtherState(routeBus);
}

class _OtherState extends State<Other> {
  final RouteBus routeBus;

  _OtherState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
