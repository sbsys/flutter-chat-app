/* flutter */
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
/* services */
import 'package:mobile_app/services/auth_service.dart';
/* env */
import 'package:mobile_app/env/env.dart';

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService with ChangeNotifier {
  late io.Socket _socket;

  ServerStatus _serverStatus = ServerStatus.connecting;
  ServerStatus get serverStatus => _serverStatus;

  void connect() async {
    final token = await AuthService.getToken();

    _socket = io.io(Env.getWS(), {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {'x-token': token}
    });

    _socket.on('connect', (_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }

  void disconnect() {
    _socket.disconnect();
  }
}
