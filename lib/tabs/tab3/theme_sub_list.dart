import 'package:flutter/material.dart';

class ThemeSubList extends StatefulWidget {
  final ValueChanged<int> onPush;

  ThemeSubList({Key key, this.onPush}) : super(key: key);

  @override
  _ThemeSubListState createState() => _ThemeSubListState(onPush);

}

class _ThemeSubListState extends State<ThemeSubList> {
  final ValueChanged<int> onPush;

  _ThemeSubListState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
