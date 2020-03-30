import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  final ValueChanged<int> onPush;

  Other({Key key, this.onPush}) : super(key: key);

  @override
  _OtherState createState() => _OtherState(onPush);

}

class _OtherState extends State<Other> {
  final ValueChanged<int> onPush;

  _OtherState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
