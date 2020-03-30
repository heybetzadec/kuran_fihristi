import 'package:flutter/material.dart';

class NameList extends StatefulWidget {
  final ValueChanged<int> onPush;

  NameList({Key key, this.onPush}) : super(key: key);

  @override
  _NameListState createState() => _NameListState(onPush);

}

class _NameListState extends State<NameList> {
  final ValueChanged<int> onPush;

  _NameListState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
