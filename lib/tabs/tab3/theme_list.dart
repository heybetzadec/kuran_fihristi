import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class ThemeList extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  ThemeList({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _ThemeListState createState() => _ThemeListState(onPush, eventBus);

}

class _ThemeListState extends State<ThemeList> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _ThemeListState(this.onPush, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
