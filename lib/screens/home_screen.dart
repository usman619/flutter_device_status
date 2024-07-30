import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_status/components/app_drawer.dart';
import 'package:flutter_device_status/components/neu_box.dart';
import 'package:flutter_device_status/data/computer_data.dart';
import 'package:flutter_device_status/data/computer_data_manager.dart';
import 'package:flutter_device_status/themes/text_theme.dart';
import 'package:flutter_device_status/service/websocket/websocket_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
                      final ComputerData computerData = snapshot.data!;
                      return Column(
                        children: [
                          _systemInfoNeuBox(computerData),
                          const SizedBox(height: 20),
                          _systemDetailInfoNeuBox(computerData),
                        ],
                      );
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
                  'Connection State: ${WebSocketService.isConnected() ? 'Connected' : 'Disconnected'}',
                  style: bodyTextTheme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _systemInfoNeuBox(ComputerData computerData) {
    return NeuBox(
      child: Column(children: [
        Text(
          'Username: ${computerData.username}',
          style: bodyTextTheme,
        ),
        Text(
          'Hostname: ${computerData.hostname}',
          style: bodyTextTheme,
        ),
        Text(
          'Sysname: ${computerData.sysname}',
          style: bodyTextTheme,
        ),
        Text(
          'Machine: ${computerData.machine}',
          style: bodyTextTheme,
        ),
        Text(
          'Kernel: ${computerData.kernel}',
          style: bodyTextTheme,
        ),
        Text(
          'Cpu: ${computerData.cpu}',
          style: bodyTextTheme,
        ),
        Text(
          'Cpu Percent: ${computerData.cpuPercent}',
          style: bodyTextTheme,
        ),
        Text('CPU Cores: ${computerData.cpuLogicalCores}',
            style: bodyTextTheme),
        Text(
          'CPU Physical Cores: ${computerData.cpuPhysicalCores}',
          style: bodyTextTheme,
        ),
        Text(
          'GPU Name: ${computerData.gpuName}',
          style: bodyTextTheme,
        ),
        Text(
          'GPU Id: ${computerData.gpuId}',
          style: bodyTextTheme,
        ),
        Text(
          'GPU Total Memory: ${computerData.gpuMemoryTotal}',
          style: bodyTextTheme,
        ),
        Text(
          'Virtual Memory Total: ${computerData.virtualMemoryTotal}',
          style: bodyTextTheme,
        ),
        Text(
          'Swap Memory Total: ${computerData.swapMemoryTotal}',
          style: bodyTextTheme,
        ),
        Text(
          'Disk Usage Total: ${computerData.diskUsageTotal}',
          style: bodyTextTheme,
        ),
      ]),
    );
  }

  _systemDetailInfoNeuBox(ComputerData computerData) {
    return NeuBox(
      child: Column(children: [
        Text(
          'Up Time: ${computerData.upTime}',
          style: bodyTextTheme,
        ),
        Text(
          'Boot Time: ${computerData.bootTime}',
          style: bodyTextTheme,
        ),
        Text(
          'CPU Percent: ${computerData.cpuPercent}',
          style: bodyTextTheme,
        ),
        Text(
          'Core Temp: ${computerData.coreTemps}',
          style: bodyTextTheme,
        ),
        Text(
          'GPU Load: ${computerData.gpuLoad}',
          style: bodyTextTheme,
        ),
        Text(
          'GPU Temp: ${computerData.gpuTemp}',
          style: bodyTextTheme,
        ),
        Text(
          'NVMe Temp: ${computerData.nvmeTemp}',
          style: bodyTextTheme,
        ),
        Text(
          'Virtual Memory Percent: ${computerData.virtualMemoryPercent}',
          style: bodyTextTheme,
        ),
        Text(
          'Swap Memory Percent: ${computerData.swapMemoryPercent}',
          style: bodyTextTheme,
        ),
        Text(
          'Disk Usage Percent: ${computerData.diskUsagePercent}',
          style: bodyTextTheme,
        ),
        Text(
          'Battery Percent: ${computerData.batteryPercent}',
          style: bodyTextTheme,
        ),
        Text(
          'Battery Secs Left: ${computerData.batterySecsLeft}',
          style: bodyTextTheme,
        ),
        Text(
          'Battery Power Plugged: ${computerData.batteryPowerPlugged}',
          style: bodyTextTheme,
        ),
        Text(
          'GPU Memory Used: ${computerData.gpuMemoryUsed}',
          style: bodyTextTheme,
        ),
        Text(
          'GPU Memory Free: ${computerData.gpuMemoryFree}',
          style: bodyTextTheme,
        ),
        Text(
          'Virtual Memory Available: ${computerData.virtualMemoryFree}',
          style: bodyTextTheme,
        ),
        Text(
          'Virtual Memory Used: ${computerData.virtualMemoryUsed}',
          style: bodyTextTheme,
        ),
        Text(
          'Swap Memory Available: ${computerData.swapMemoryFree}',
          style: bodyTextTheme,
        ),
        Text(
          'Swap Memory Used: ${computerData.swapMemoryUsed}',
          style: bodyTextTheme,
        ),
      ]),
    );
  }
}
