import 'package:injectable/injectable.dart';

@singleton
class SingletonProbeService {
  static int _nextId = 0;
  final int id = ++_nextId;
}

@injectable
class FactoryProbeService {
  static int _nextId = 0;
  final int id = ++_nextId;
}
