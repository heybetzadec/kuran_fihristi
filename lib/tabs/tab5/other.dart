import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:kuranfihristi/help/event_key.dart';
import 'package:kuranfihristi/help/route_bus.dart';

class Other extends StatefulWidget {
  final RouteBus routeBus;

  Other({Key key, this.routeBus}) : super(key: key);

  @override
  _OtherState createState() => _OtherState(routeBus);
}

class _OtherState extends State<Other> {
  final RouteBus routeBus;

  _OtherState(this.routeBus);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
              onPressed: (){
                routeBus.eventBus.fire(BottomNavEvent('tr'));
                routeBus.languageCode = 'tr';
              },
            child: Text('Dil deyis'),
              ),
        ),
      ),
    );
  }
}
