import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/app_drawer.dart';
import 'package:flutter_device_status/themes/text_theme.dart';
import 'package:flutter_device_status/websocket/websocket_communication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WebsocketCommunication? _websocketCommunication;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _websocketCommunication = WebsocketCommunication('ws://localhost:9499');
    super.initState();
  }

  @override
  void dispose() {
    _websocketCommunication?.disconnect();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'HOME',
          style: titleTextTheme,
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Send a message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _websocketCommunication?.sendMessage(_controller.text);
              },
              child: Text(
                'Send Message',
                style: bodyTextTheme,
              ),
            ),
            const SizedBox(height: 20),
            StreamBuilder(
              stream: _websocketCommunication?.messages,
              builder: (context, snapshot) {
                return Text(
                  snapshot.hasData ? '${snapshot.data}' : '',
                  style: bodyTextTheme,
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Connection State: ${_websocketCommunication?.state.toString().split('.').last ?? 'disconnected'}',
              style: bodyTextTheme,
            ),
          ],
        ),
      ),
    );
  }
}

























// import 'package:flutter/material.dart';
// import 'package:flutter_device_status/components/app_drawer.dart';
// import 'package:flutter_device_status/themes/text_theme.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.surface,
//           title: Text(
//             'HOME',
//             style: titleTextTheme,
//           ),
//           centerTitle: true,
//         ),
//         drawer: const AppDrawer(),
//         body: Center(
//           child: Text('Home', style: bodyTextTheme),
//         ));
//   }
// }
