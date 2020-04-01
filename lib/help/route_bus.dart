import 'package:event_bus/event_bus.dart';
import 'package:sqflite/sqflite.dart';

class RouteBus {
  final EventBus eventBus;
  final  Future<Database> dbf;
  final int languageId;
  final int translationId;

  RouteBus({
    this.eventBus,
    this.dbf,
    this.languageId,
    this.translationId,
  });
}
