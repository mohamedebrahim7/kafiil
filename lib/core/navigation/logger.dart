import 'package:logger/logger.dart';
Logger get log => Log.instance;

class Log extends Logger {
  Log._() : super(printer: PrettyPrinter(methodCount: 0,),filter: null);
  static final instance = Log._();
}