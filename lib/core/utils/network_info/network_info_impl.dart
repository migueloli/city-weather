import 'package:city_weather/core/utils/network_info/network_info.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';


class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _connectionChecker;

  const NetworkInfoImpl(this._connectionChecker);

  @override
  Future<bool> get isConnected => _connectionChecker.hasInternetAccess;
  
  @override
  Stream<bool> get onConnectionChange => _connectionChecker.onStatusChange.map((status) => status == InternetStatus.connected);
} 