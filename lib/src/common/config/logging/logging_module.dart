import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

@module
abstract class LoggingModule {
  @lazySingleton
  Talker talker() => Talker();
}
