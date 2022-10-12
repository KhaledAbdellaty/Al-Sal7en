import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get iscommected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;
  NetworkInfoImpl(this.connectionChecker);
  @override
  // TODO: implement iscommected
  Future<bool> get iscommected => connectionChecker.hasConnection;
}
