import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  final ValueChanged<int> onPush;

  Template({Key key, this.onPush}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState(onPush);
}

class _TemplateState extends State<Template> {
  final ValueChanged<int> onPush;

  _TemplateState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
