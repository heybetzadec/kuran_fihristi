import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class ThemeSubList extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  ThemeSubList({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _ThemeSubListState createState() => _ThemeSubListState(onPush, eventBus);

}

class _ThemeSubListState extends State<ThemeSubList> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _ThemeSubListState(this.onPush, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
