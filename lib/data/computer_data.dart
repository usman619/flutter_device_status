import 'package:flutter_device_status/data/computer_data_manager.dart';

class ComputerData {
  final String? username;
  final String? hostname;
  final String? sysname;
  final String? machine;
  final String? kernel;

  final String? upTime;
  final String? bootTime;

  final String? cpu;
  final String? cpuPercent;
  final String? coreTemps;
  final String? cpuLogicalCores;
  final String? cpuPhysicalCores;
  final String? cpuCurrentFreq;
  final String? cpuMinFreq;
  final String? cpuMaxFreq;

  final String? gpuName;
  final String? gpuId;
  final String? gpuLoad;
  final String? gpuTemp;
  final String? gpuMemoryTotal;
  final String? gpuMemoryUsed;
  final String? gpuMemoryFree;

  final String? batteryPercent;
  final String? batterySecsLeft;
  final bool? batteryPowerPlugged;

  final String? virtualMemoryTotal;
  final String? virtualMemoryUsed;
  final String? virtualMemoryFree;
  final String? virtualMemoryPercent;
  final String? virtualMemoryCached;

  final String? swapMemoryTotal;
  final String? swapMemoryUsed;
  final String? swapMemoryPercent;
  final String? swapMemoryFree;

  final String? nvmeTemp;

  final String? diskUsageTotal;
  final String? diskUsageUsed;
  final String? diskUsageFree;
  final String? diskUsagePercent;

  ComputerData(
      {this.username,
      this.hostname,
      this.sysname,
      this.machine,
      this.kernel,
      this.upTime,
      this.bootTime,
      this.cpu,
      this.cpuPercent,
      this.coreTemps,
      this.cpuLogicalCores,
      this.cpuPhysicalCores,
      this.cpuCurrentFreq,
      this.cpuMinFreq,
      this.cpuMaxFreq,
      this.gpuName,
      this.gpuId,
      this.gpuLoad,
      this.gpuTemp,
      this.gpuMemoryTotal,
      this.gpuMemoryUsed,
      this.gpuMemoryFree,
      this.batteryPercent,
      this.batterySecsLeft,
      this.batteryPowerPlugged,
      this.virtualMemoryTotal,
      this.virtualMemoryUsed,
      this.virtualMemoryFree,
      this.virtualMemoryPercent,
      this.virtualMemoryCached,
      this.swapMemoryTotal,
      this.swapMemoryUsed,
      this.swapMemoryPercent,
      this.swapMemoryFree,
      this.nvmeTemp,
      this.diskUsageTotal,
      this.diskUsageUsed,
      this.diskUsageFree,
      this.diskUsagePercent});

  factory ComputerData.emptyData() {
    return ComputerData(
        username: '',
        hostname: '',
        sysname: '',
        machine: '',
        kernel: '',
        upTime: '0',
        bootTime: '0',
        cpu: '',
        cpuPercent: '0',
        cpuLogicalCores: '0',
        cpuPhysicalCores: '0',
        cpuCurrentFreq: '0',
        cpuMinFreq: '0',
        cpuMaxFreq: '0',
        gpuName: '',
        gpuId: '',
        gpuLoad: '0',
        gpuTemp: '0',
        gpuMemoryTotal: '0',
        gpuMemoryUsed: '0',
        gpuMemoryFree: '0',
        batteryPercent: '0',
        batterySecsLeft: '0',
        batteryPowerPlugged: false,
        virtualMemoryTotal: '0',
        virtualMemoryUsed: '0',
        virtualMemoryFree: '0',
        virtualMemoryPercent: '0',
        virtualMemoryCached: '0',
        swapMemoryTotal: '0',
        swapMemoryUsed: '0',
        swapMemoryPercent: '0',
        swapMemoryFree: '0',
        nvmeTemp: '0',
        diskUsageTotal: '0',
        diskUsageUsed: '0',
        diskUsageFree: '0',
        diskUsagePercent: '0');
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
      sysname: json.containsKey('system')
          ? json['system'].toString()
          : currentComputerData.sysname,
      machine: json.containsKey('machine')
          ? json['machine'].toString()
          : currentComputerData.machine,
      kernel: json.containsKey('kernel')
          ? json['kernel'].toString()
          : currentComputerData.kernel,
      upTime: json.containsKey('up_time')
          ? json['up_time'].toString()
          : currentComputerData.upTime,
      bootTime: json.containsKey('boot_time')
          ? json['boot_time'].toString()
          : currentComputerData.bootTime,
      cpu: json.containsKey('cpu')
          ? json['cpu'].toString()
          : currentComputerData.cpu,
      cpuPercent: json.containsKey('cpu_percent')
          ? json['cpu_percent'].toString()
          : currentComputerData.cpuPercent,
      coreTemps: json.containsKey('core_temp')
          ? json['core_temp'].toString()
          : currentComputerData.coreTemps,
      cpuLogicalCores: json.containsKey('cpu_core_logical')
          ? json['cpu_core_logical'].toString()
          : currentComputerData.cpuLogicalCores,
      cpuPhysicalCores: json.containsKey('cpu_core_physical')
          ? json['cpu_core_physical'].toString()
          : currentComputerData.cpuPhysicalCores,
      cpuCurrentFreq: json.containsKey('cpu_current_freq')
          ? json['cpu_current_freq'].toString()
          : currentComputerData.cpuCurrentFreq,
      cpuMinFreq: json.containsKey('cpu_freq_min')
          ? json['cpu_freq_min'].toString()
          : currentComputerData.cpuMinFreq,
      cpuMaxFreq: json.containsKey('cpu_freq_max')
          ? json['cpu_freq_max'].toString()
          : currentComputerData.cpuMaxFreq,
      gpuName: json.containsKey('gpu_name')
          ? json['gpu_name'].toString()
          : currentComputerData.gpuName,
      gpuId: json.containsKey('gpu_id')
          ? json['gpu_id'].toString()
          : currentComputerData.gpuId,
      gpuLoad: json.containsKey('gpu_load')
          ? json['gpu_load'].toString()
          : currentComputerData.gpuLoad,
      gpuTemp: json.containsKey('gpu_temp')
          ? json['gpu_temp'].toString()
          : currentComputerData.gpuTemp,
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
      virtualMemoryFree: json.containsKey('virtual_memory_available')
          ? json['virtual_memory_available'].toString()
          : currentComputerData.virtualMemoryFree,
      virtualMemoryPercent: json.containsKey('virtual_memory_percent')
          ? json['virtual_memory_percent'].toString()
          : currentComputerData.virtualMemoryPercent,
      virtualMemoryCached: json.containsKey('virtual_memory_cached')
          ? json['virtual_memory_cached'].toString()
          : currentComputerData.virtualMemoryCached,
      swapMemoryTotal: json.containsKey('swap_memory_total')
          ? json['swap_memory_total'].toString()
          : currentComputerData.swapMemoryTotal,
      swapMemoryUsed: json.containsKey('swap_memory_used')
          ? json['swap_memory_used'].toString()
          : currentComputerData.swapMemoryUsed,
      swapMemoryFree: json.containsKey('swap_memory_available')
          ? json['swap_memory_available'].toString()
          : currentComputerData.swapMemoryFree,
      swapMemoryPercent: json.containsKey('swap_memory_percent')
          ? json['swap_memory_percent'].toString()
          : currentComputerData.swapMemoryPercent,
      nvmeTemp: json.containsKey('nvme_temp')
          ? json['nvme_temp'].toString()
          : currentComputerData.nvmeTemp,
      diskUsageTotal: json.containsKey('disk_usage_total')
          ? json['disk_usage_total'].toString()
          : currentComputerData.diskUsageTotal,
      diskUsageUsed: json.containsKey('disk_usage_used')
          ? json['disk_usage_used'].toString()
          : currentComputerData.diskUsageUsed,
      diskUsageFree: json.containsKey('disk_usage_available')
          ? json['disk_usage_available'].toString()
          : currentComputerData.diskUsageFree,
      diskUsagePercent: json.containsKey('disk_usage_percent')
          ? json['disk_usage_percent'].toString()
          : currentComputerData.diskUsagePercent,
    );
  }

  List<String> getStatsDetailList(String typeString) {
    switch (typeString) {
      case 'CPU':
        return [
          'CPU: $cpu',
          'CPU Percent: $cpuPercent',
          'CPU Cores: $cpuLogicalCores',
          'CPU Physical Cores: $cpuPhysicalCores',
          'CPU Current Frequency: $cpuCurrentFreq',
          'CPU Min Frequency: $cpuMinFreq',
          'CPU Max Frequency: $cpuMaxFreq',
        ];
      case 'GPU':
        return [
          'GPU Name: $gpuName',
          'GPU Load: $gpuLoad',
          'GPU Temperature: $gpuTemp',
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
