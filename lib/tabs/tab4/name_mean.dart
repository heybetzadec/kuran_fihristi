import 'package:flutter/material.dart';

class NameMean extends StatefulWidget {
  final ValueChanged<int> onPush;

  NameMean({Key key, this.onPush}) : super(key: key);

  @override
  _NameMeanState createState() => _NameMeanState(onPush);

}

class _NameMeanState extends State<NameMean> {
  final ValueChanged<int> onPush;

  _NameMeanState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
