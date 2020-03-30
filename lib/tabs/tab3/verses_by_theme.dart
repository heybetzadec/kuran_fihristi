import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class VersesByTheme extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  VersesByTheme({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _VersesByThemeState createState() => _VersesByThemeState(onPush, eventBus);

}

class _VersesByThemeState extends State<VersesByTheme> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _VersesByThemeState(this.onPush, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
