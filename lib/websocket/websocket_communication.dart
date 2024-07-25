import 'package:flutter_device_status/websocket/communication_state.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebsocketCommunication {
  final WebSocketChannel channel;
  CommunicationState _state = CommunicationState.disconnected;

  WebsocketCommunication(String url)
      : channel = WebSocketChannel.connect(Uri.parse(url)) {
    _state = CommunicationState.connected;
  }

  CommunicationState get state => _state;

  void sendMessage(String message) {
    if (_state == CommunicationState.connected) {
      channel.sink.add(message);
    }
  }

  Stream<String> get messages =>
      channel.stream.map((event) => event.toString());

  void disconnect() {
    channel.sink.close(status.goingAway);
    _state = CommunicationState.disconnected;
  }
}
