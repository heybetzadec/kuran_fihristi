import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class Other extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  Other({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _OtherState createState() => _OtherState(onPush, eventBus);

}

class _OtherState extends State<Other> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _OtherState(this.onPush, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}
