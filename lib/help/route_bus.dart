import 'package:event_bus/event_bus.dart';
import 'package:sqflite/sqflite.dart';

class RouteBus {
  final EventBus eventBus;
  final  Future<Database> dbf;

  RouteBus({
    this.eventBus,
    this.dbf,
  });
}
