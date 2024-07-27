import 'package:flutter_device_status/data/computer_data_manager.dart';

class ComputerData {
  final String? username;
  final String? hostname;
  final String? sysname;
  final String? machine;
  final String? kernel;
  final String? uptime;
  final String? cpu;

  final String? cpuPercent;
  final String? cpuCores;
  final String? cpuPhysicalCores;
  final String? cpuCurrentFreq;
  final String? cpuMinFreq;
  final String? cpuMaxFreq;

  final String? gpuName;
  final String? gpuLoad;
  final String? gpuTemperature;
  final String? gpuMemoryTotal;
  final String? gpuMemoryUsed;
  final String? gpuMemoryFree;

  final String? batteryPercent;
  final String? batterySecsLeft;
  final bool? batteryPowerPlugged;

  final String? virtualMemoryTotal;
  final String? virtualMemoryUsed;
  final String? virtualMemoryFree;
  final String? virtualMemoryCached;

  final String? swapMemoryTotal;
  final String? swapMemoryUsed;
  final String? swapMemoryFree;

  final String? diskUsageTotal;
  final String? diskUsageUsed;
  final String? diskUsageFree;

  ComputerData({
    this.username,
    this.hostname,
    this.sysname,
    this.machine,
    this.kernel,
    this.uptime,
    this.cpu,
    this.cpuPercent,
    this.cpuCores,
    this.cpuPhysicalCores,
    this.cpuCurrentFreq,
    this.cpuMinFreq,
    this.cpuMaxFreq,
    this.gpuName,
    this.gpuLoad,
    this.gpuTemperature,
    this.gpuMemoryTotal,
    this.gpuMemoryUsed,
    this.gpuMemoryFree,
    this.batteryPercent,
    this.batterySecsLeft,
    this.batteryPowerPlugged,
    this.virtualMemoryTotal,
    this.virtualMemoryUsed,
    this.virtualMemoryFree,
    this.virtualMemoryCached,
    this.swapMemoryTotal,
    this.swapMemoryUsed,
    this.swapMemoryFree,
    this.diskUsageTotal,
    this.diskUsageUsed,
    this.diskUsageFree,
  });

  factory ComputerData.emptyData() {
    return ComputerData(
      username: '',
      hostname: '',
      sysname: '',
      machine: '',
      kernel: '',
      uptime: '0',
      cpu: '',
      cpuPercent: '0',
      cpuCores: '0',
      cpuPhysicalCores: '0',
      cpuCurrentFreq: '0',
      cpuMinFreq: '0',
      cpuMaxFreq: '0',
      gpuName: '',
      gpuLoad: '0',
      gpuTemperature: '0',
      gpuMemoryTotal: '0',
      gpuMemoryUsed: '0',
      gpuMemoryFree: '0',
      batteryPercent: '0',
      batterySecsLeft: '0',
      batteryPowerPlugged: false,
      virtualMemoryTotal: '0',
      virtualMemoryUsed: '0',
      virtualMemoryFree: '0',
      virtualMemoryCached: '0',
      swapMemoryTotal: '0',
      swapMemoryUsed: '0',
      swapMemoryFree: '0',
      diskUsageTotal: '0',
      diskUsageUsed: '0',
      diskUsageFree: '0',
    );
  }

  factory ComputerData.fromJson(Map<String, dynamic> json) {
    final ComputerData currentComputerData = ComputerDataManager.computerData;
    return ComputerData(
      username: json.containsKey('username')
          ? json['username'].toString()
          : currentComputerData.username,
      hostname: json.containsKey('hostname')
          ? json['hostname'].toString()
          : currentComputerData.hostname,
      sysname: json.containsKey('sysname')
          ? json['sysname'].toString()
          : currentComputerData.sysname,
      machine: json.containsKey('machine')
          ? json['machine'].toString()
          : currentComputerData.machine,
      kernel: json.containsKey('kernel')
          ? json['kernel'].toString()
          : currentComputerData.kernel,
      uptime: json.containsKey('uptime')
          ? json['uptime'].toString()
          : currentComputerData.uptime,
      cpu: json.containsKey('cpu')
          ? json['cpu'].toString()
          : currentComputerData.cpu,
      cpuPercent: json.containsKey('cpu_percent')
          ? json['cpu_percent'].toString()
          : currentComputerData.cpuPercent,
      cpuCores: json.containsKey('cpu_cores')
          ? json['cpu_cores'].toString()
          : currentComputerData.cpuCores,
      cpuPhysicalCores: json.containsKey('cpu_physical_cores')
          ? json['cpu_physical_cores'].toString()
          : currentComputerData.cpuPhysicalCores,
      cpuCurrentFreq: json.containsKey('cpu_current_freq')
          ? json['cpu_current_freq'].toString()
          : currentComputerData.cpuCurrentFreq,
      cpuMinFreq: json.containsKey('cpu_min_freq')
          ? json['cpu_min_freq'].toString()
          : currentComputerData.cpuMinFreq,
      cpuMaxFreq: json.containsKey('cpu_max_freq')
          ? json['cpu_max_freq'].toString()
          : currentComputerData.cpuMaxFreq,
      gpuName: json.containsKey('gpu_name')
          ? json['gpu_name'].toString()
          : currentComputerData.gpuName,
      gpuLoad: json.containsKey('gpu_load')
          ? json['gpu_load'].toString()
          : currentComputerData.gpuLoad,
      gpuTemperature: json.containsKey('gpu_temperature')
          ? json['gpu_temperature'].toString()
          : currentComputerData.gpuTemperature,
      gpuMemoryTotal: json.containsKey('gpu_memory_total')
          ? json['gpu_memory_total'].toString()
          : currentComputerData.gpuMemoryTotal,
      gpuMemoryUsed: json.containsKey('gpu_memory_used')
          ? json['gpu_memory_used'].toString()
          : currentComputerData.gpuMemoryUsed,
      gpuMemoryFree: json.containsKey('gpu_memory_free')
          ? json['gpu_memory_free'].toString()
          : currentComputerData.gpuMemoryFree,
      batteryPercent: json.containsKey('battery_percent')
          ? json['battery_percent'].toString()
          : currentComputerData.batteryPercent,
      batterySecsLeft: json.containsKey('battery_secs_left')
          ? json['battery_secs_left'].toString()
          : currentComputerData.batterySecsLeft,
      batteryPowerPlugged: json.containsKey('battery_power_plugged')
          ? json['battery_power_plugged']
          : currentComputerData.batteryPowerPlugged,
      virtualMemoryTotal: json.containsKey('virtual_memory_total')
          ? json['virtual_memory_total'].toString()
          : currentComputerData.virtualMemoryTotal,
      virtualMemoryUsed: json.containsKey('virtual_memory_used')
          ? json['virtual_memory_used'].toString()
          : currentComputerData.virtualMemoryUsed,
      virtualMemoryFree: json.containsKey('virtual_memory_free')
          ? json['virtual_memory_free'].toString()
          : currentComputerData.virtualMemoryFree,
      virtualMemoryCached: json.containsKey('virtual_memory_cached')
          ? json['virtual_memory_cached'].toString()
          : currentComputerData.virtualMemoryCached,
      swapMemoryTotal: json.containsKey('swap_memory_total')
          ? json['swap_memory_total'].toString()
          : currentComputerData.swapMemoryTotal,
      swapMemoryUsed: json.containsKey('swap_memory_used')
          ? json['swap_memory_used'].toString()
          : currentComputerData.swapMemoryUsed,
      swapMemoryFree: json.containsKey('swap_memory_free')
          ? json['swap_memory_free'].toString()
          : currentComputerData.swapMemoryFree,
      diskUsageTotal: json.containsKey('disk_usage_total')
          ? json['disk_usage_total'].toString()
          : currentComputerData.diskUsageTotal,
      diskUsageUsed: json.containsKey('disk_usage_used')
          ? json['disk_usage_used'].toString()
          : currentComputerData.diskUsageUsed,
      diskUsageFree: json.containsKey('disk_usage_free')
          ? json['disk_usage_free'].toString()
          : currentComputerData.diskUsageFree,
    );
  }

  List<String> getStatsDetailList(String typeString) {
    switch (typeString) {
      case 'CPU':
        return [
          'CPU: $cpu',
          'CPU Percent: $cpuPercent',
          'CPU Cores: $cpuCores',
          'CPU Physical Cores: $cpuPhysicalCores',
          'CPU Current Frequency: $cpuCurrentFreq',
          'CPU Min Frequency: $cpuMinFreq',
          'CPU Max Frequency: $cpuMaxFreq',
        ];
      case 'GPU':
        return [
          'GPU Name: $gpuName',
          'GPU Load: $gpuLoad',
          'GPU Temperature: $gpuTemperature',
          'GPU Memory Total: $gpuMemoryTotal',
          'GPU Memory Used: $gpuMemoryUsed',
          'GPU Memory Free: $gpuMemoryFree',
        ];
      case 'Battery':
        return [
          'Battery Percent: $batteryPercent',
          'Battery Seconds Left: $batterySecsLeft',
          'Battery Power Plugged: $batteryPowerPlugged',
        ];
      case 'Virtual Memory':
        return [
          'Virtual Memory Total: $virtualMemoryTotal',
          'Virtual Memory Used: $virtualMemoryUsed',
          'Virtual Memory Free: $virtualMemoryFree',
          'Virtual Memory Cached: $virtualMemoryCached',
        ];
      case 'Swap Memory':
        return [
          'Swap Memory Total: $swapMemoryTotal',
          'Swap Memory Used: $swapMemoryUsed',
          'Swap Memory Free: $swapMemoryFree',
        ];
      case 'Disk Usage':
        return [
          'Disk Usage Total: $diskUsageTotal',
          'Disk Usage Used: $diskUsageUsed',
          'Disk Usage Free: $diskUsageFree',
        ];
      default:
        return <String>['Error: type $typeString not found'];
    }
  }
}
