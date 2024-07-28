import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/app_drawer.dart';
import 'package:flutter_device_status/data/computer_data.dart';
import 'package:flutter_device_status/data/computer_data_manager.dart';
import 'package:flutter_device_status/service/websocket/communication_state.dart';
import 'package:flutter_device_status/themes/text_theme.dart';
import 'package:flutter_device_status/service/websocket/websocket_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // TextField(
                //   controller: _controller,
                //   decoration: const InputDecoration(labelText: 'Send a message'),
                // ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    WebSocketService.askSystemDetails();
                  },
                  child: Text(
                    'Get System Info',
                    style: bodyTextTheme,
                  ),
                ),
                const SizedBox(height: 20),
                StreamBuilder<ComputerData>(
                  stream: ComputerDataManager.computerDataController.stream,
                  builder: (context, AsyncSnapshot<ComputerData> snapshot) {
                    if (snapshot.hasData) {
                      // print("Snapshot has data");

                      return Column(children: [
                        Text('Username: ${snapshot.data!.username}',
                            style: bodyTextTheme),
                        Text('Hostname: ${snapshot.data!.hostname}',
                            style: bodyTextTheme),
                        Text('Sysname: ${snapshot.data!.sysname}',
                            style: bodyTextTheme),
                        Text('Machine: ${snapshot.data!.machine}',
                            style: bodyTextTheme),
                        Text('Kernel: ${snapshot.data!.kernel}',
                            style: bodyTextTheme),
                        Text('Uptime: ${snapshot.data!.uptime}',
                            style: bodyTextTheme),
                        Text('CPU: ${snapshot.data!.cpu}',
                            style: bodyTextTheme),
                        Text('CPU Percent: ${snapshot.data!.cpuPercent}',
                            style: bodyTextTheme),
                        Text('CPU Cores: ${snapshot.data!.cpuCores}',
                            style: bodyTextTheme),
                        Text(
                            'CPU Physical Cores: ${snapshot.data!.cpuPhysicalCores}',
                            style: bodyTextTheme),
                        Text(
                            'CPU Current Freq: ${snapshot.data!.cpuCurrentFreq}',
                            style: bodyTextTheme),
                        Text('CPU Min Freq: ${snapshot.data!.cpuMinFreq}',
                            style: bodyTextTheme),
                        Text('CPU Max Freq: ${snapshot.data!.cpuMaxFreq}',
                            style: bodyTextTheme),
                        Text('GPU Name: ${snapshot.data!.gpuName}',
                            style: bodyTextTheme),
                        Text('GPU Load: ${snapshot.data!.gpuLoad}',
                            style: bodyTextTheme),
                        Text(
                            'GPU Temperature: ${snapshot.data!.gpuTemperature}',
                            style: bodyTextTheme),
                        Text(
                            'GPU Memory Total: ${snapshot.data!.gpuMemoryTotal}',
                            style: bodyTextTheme),
                        Text('GPU Memory Used: ${snapshot.data!.gpuMemoryUsed}',
                            style: bodyTextTheme),
                        Text('GPU Memory Free: ${snapshot.data!.gpuMemoryFree}',
                            style: bodyTextTheme),
                        Text('RAM Total: ${snapshot.data!.virtualMemoryTotal}',
                            style: bodyTextTheme),
                        Text('RAM Used: ${snapshot.data!.virtualMemoryUsed}',
                            style: bodyTextTheme),
                        Text('RAM Free: ${snapshot.data!.virtualMemoryFree}',
                            style: bodyTextTheme),
                        Text(
                            'RAM Cached: ${snapshot.data!.virtualMemoryCached}',
                            style: bodyTextTheme),
                        Text('Swap Total: ${snapshot.data!.swapMemoryTotal}',
                            style: bodyTextTheme),
                        Text('Swap Used: ${snapshot.data!.swapMemoryUsed}',
                            style: bodyTextTheme),
                        Text('Swap Free: ${snapshot.data!.swapMemoryFree}',
                            style: bodyTextTheme),
                        Text('Disk Total: ${snapshot.data!.diskUsageTotal}',
                            style: bodyTextTheme),
                        Text('Disk Used: ${snapshot.data!.diskUsageUsed}',
                            style: bodyTextTheme),
                        Text('Disk Free: ${snapshot.data!.diskUsageFree}',
                            style: bodyTextTheme),
                      ]);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Center(
                        child: CupertinoActivityIndicator(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Connection State: ${WebSocketService.webSocketState == WebSocketState.connected ? 'Connected' : 'Disconnected'}',
                  style: bodyTextTheme,
                ),
              ],
            ),
          ),
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
