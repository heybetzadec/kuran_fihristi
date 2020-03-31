import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/for_route.dart';

class VersesByWord extends StatefulWidget {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  VersesByWord({Key key, this.onPush, this.eventBus}) : super(key: key);

  @override
  _VersesByWordState createState() => _VersesByWordState(onPush, eventBus);
}

class _VersesByWordState extends State<VersesByWord> {
  final ValueChanged<ForRoute> onPush;
  final EventBus eventBus;

  _VersesByWordState(this.onPush, this.eventBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
