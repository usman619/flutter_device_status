import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_device_status/data/computer_data.dart';
import 'package:flutter_device_status/data/computer_data_manager.dart';
import 'package:flutter_device_status/service/websocket/communication_state.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService {
  static const int port = 9499;
  static WebSocketService? currentWebsocket;
  static WebSocketState webSocketState = WebSocketState.disconnected;

  late IOWebSocketChannel channel;
  late Timer timer;

  WebSocketService() {
    webSocketState = WebSocketState.disconnected;
  }

  Future<void> connect() async {
    // In case of different computers or devices, the IP address should be used instead of localhost
    const String url = 'ws://localhost:$port';
    debugPrint('Connecting to $url .....');
    channel = IOWebSocketChannel.connect(url);
    debugPrint('Connected to $url !');

    webSocketState = WebSocketState.connected;
    // Creating a Stream and listening to it
    final Stream stream = channel.stream.asBroadcastStream();
    stream.listen((dynamic data) {
      debugPrint('Stream Data: $data');
      final ComputerData computerData =
          ComputerData.fromJson(json.decode(data));
      ComputerDataManager.addComputerData(computerData);
    }, onDone: () {
      webSocketState = WebSocketState.disconnected;
      ComputerDataManager.addComputerData(null);
    }, onError: (dynamic e) {
      webSocketState = WebSocketState.disconnected;
      ComputerDataManager.addComputerData(null);
    }, cancelOnError: true);

    currentWebsocket!.channel.sink.add('get_system_info()');

    // Call a function askSystemDetails() to get the system details from the server
    timer = Timer.periodic(
        const Duration(seconds: 2), (Timer t) => askSystemDetails());
  }

  static void askSystemDetails() {
    if (currentWebsocket == null) {
      currentWebsocket = WebSocketService();
      currentWebsocket!.connect();
    } else if (webSocketState == WebSocketState.disconnected) {
      currentWebsocket!.connect();
    } else {
      currentWebsocket!.channel.sink.add('get_details()');
    }
  }

  static bool isConnected() {
    if (webSocketState == WebSocketState.connected) {
      return true;
    } else {
      return false;
    }
  }
}
