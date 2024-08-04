import GPUtil
import psutil
import os
import time
from datetime import datetime
import cpuinfo
import json
import speedtest

os_name = os.uname()
username = os.getlogin()
hostname = getattr(os_name, 'nodename')
system = getattr(os_name, 'sysname')
machine = getattr(os_name, 'machine')
kernel = getattr(os_name, 'release')

# CPU Information
cpu = cpuinfo.get_cpu_info()['brand_raw']
cpu_core_logical = psutil.cpu_count()
cpu_core_physical = psutil.cpu_count(logical=False)
cpu_percent = psutil.cpu_percent()
cpu_freq_current = f"{psutil.cpu_freq().current: .2f} MHz "
cpu_freq_min = f"{psutil.cpu_freq().min: .2f} MHz "
cpu_freq_max = f"{psutil.cpu_freq().max: .2f} MHz "


# Core Temperature
def get_cpu_core_temperatures():
    temp_data = psutil.sensors_temperatures()
    if 'coretemp' not in temp_data:
        return "No core temperature data available."

    core_temps = temp_data['coretemp']
    result = []

    for core in core_temps:
        core_info = f"{core.label} : {core.current} °C"
        result.append(core_info)

    result.remove(result[0])
    return result

# Boot Time and Up Time
def get_boot_time():
    boot_time = psutil.boot_time()
    boot_time_str = datetime.fromtimestamp(boot_time).strftime("%Y-%m-%d %H:%M:%S")
    return boot_time_str

def get_uptime():
    boot_time = psutil.boot_time()
    current_time = time.time()
    uptime_seconds = current_time - boot_time

    uptime_minutes = uptime_seconds / 60
    uptime_hours = uptime_minutes / 60

    return uptime_seconds, uptime_minutes, uptime_hours

# GPU Information

gpus = GPUtil.getGPUs()
gpu_name = ""
gpu_id = ""
gpu_total_memory = ""
gpu_used_memory = ""
gpu_free_memory = ""
gpu_load = ""
gpu_temp = ""

if not gpus:
    gpu = "No GPU found."
else:
    gpu = gpus[0]
    gpu_name = gpu.name
    gpu_id = gpu.uuid
    gpu_total_memory = f"{gpu.memoryTotal} MB"
    gpu_used_memory = f"{gpu.memoryUsed} MB"
    gpu_free_memory = f"{gpu.memoryFree} MB"
    gpu_load = f"{gpu.load * 100:.2f}"
    gpu_temp = f"{gpu.temperature} °C"




# NVMe Temperature
nvme_temp =  f"{psutil.sensors_temperatures()['nvme'][0].current} °C"

# Memory Information

def bytes_to_human_readable(num_bytes):
    for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
        if num_bytes < 1024.0:
            return f"{num_bytes:.2f} {unit}"
        num_bytes /= 1024.0

# -----------------------------------------------------------------------------------
virtual_memory_total = bytes_to_human_readable(psutil.virtual_memory().total)
virtual_memory_available = bytes_to_human_readable(psutil.virtual_memory().available)
virtual_memory_used = bytes_to_human_readable(psutil.virtual_memory().used)
virtual_memory_percent = psutil.virtual_memory().percent
# -----------------------------------------------------------------------------------
swap_memory_total = bytes_to_human_readable(psutil.swap_memory().total)
swap_memory_available = bytes_to_human_readable(psutil.swap_memory().free)
swap_memory_used = bytes_to_human_readable(psutil.swap_memory().used)
# -----------------------------------------------------------------------------------
disk_usage_total = bytes_to_human_readable(psutil.disk_usage('/').total)
disk_usage_available = bytes_to_human_readable(psutil.disk_usage('/').free)
disk_usage_used = bytes_to_human_readable(psutil.disk_usage('/').used)
# -----------------------------------------------------------------------------------

# Speed Test (Not using it for now as it takes a lot of time)
def get_speed_test():
    st = speedtest.Speedtest()
    st.get_best_server()
    download_speed = st.download() / 1000000 # Converting to Mbps
    upload_speed = st.upload() / 1000000 # Converting to Mbps
    return download_speed, upload_speed

# download_speed, upload_speed = get_speed_test()
# download_speed = f"{download_speed:.2f} Mbps"
# upload_speed = f"{upload_speed:.2f} Mbps"

# 13 attributes
def get_system_info():

    return json.dumps({
        "username": username,
        "hostname": hostname,
        "system": system,
        "machine": machine,
        "kernel": kernel,
        "cpu": cpu,
        "cpu_core_logical": cpu_core_logical,
        "cpu_core_physical": cpu_core_physical,
        "cpu_freq_min": cpu_freq_min,
        "cpu_freq_max": cpu_freq_max,
        "gpu_name": gpu_name,
        "gpu_id": gpu_id,
        "gpu_memory_total" : gpu_total_memory,
        
        "virtual_memory_total": virtual_memory_total,
        
        "swap_memory_total": swap_memory_total,
        
        "disk_usage_total": disk_usage_total,
        
        
    })

# 21 attributes + 2 unused attributes(download_speed, upload_speed)
def get_details():
    
    sensorsBattery = psutil.sensors_battery()
    batteryPercent = 0.0
    batterySecsLeft = 0
    batteryPowerPlugged = True
    if sensorsBattery is not None:
        batteryPercent = getattr(sensorsBattery, 'percent').__round__(2)
        batterySecsLeft = getattr(sensorsBattery, 'secsleft')
        batteryPowerPlugged=  getattr(sensorsBattery, 'power_plugged')

    return json.dumps({
        "up_time": time.strftime('%H:%M:%S', time.gmtime(get_uptime()[0])),
        "boot_time": get_boot_time(),
        "cpu_percent": cpu_percent,
        "cpu_freq_current": cpu_freq_current,
        "core_temp": get_cpu_core_temperatures(),
        "gpu_load": gpu_load,
        "gpu_temp": gpu_temp,
        "nvme_temp": nvme_temp,
        "virtual_memory_percent": virtual_memory_percent,
        "swap_memory_percent": psutil.swap_memory().percent,
        "disk_usage_percent": psutil.disk_usage('/').percent,
        "battery_percent": batteryPercent,
        "battery_secs_left": batterySecsLeft,
        "battery_power_plugged": batteryPowerPlugged,

        "gpu_memory_used": gpu_used_memory,
        "gpu_memory_free": gpu_free_memory,

        "virtual_memory_available": virtual_memory_available,
        "virtual_memory_used": virtual_memory_used,

        "swap_memory_available": swap_memory_available,
        "swap_memory_used": swap_memory_used,

        "disk_usage_available": disk_usage_available,
        "disk_usage_used": disk_usage_used,
    })

# print(get_system_info())
# print("---------------------------------------------------")
# print(get_details())

# print(get_speed_test())
# print(download_speed)
# print(upload_speed)