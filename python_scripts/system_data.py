import GPUtil
import torch
import psutil
import os
import time
import cpuinfo
import json

os_name = os.uname()
username = os.getlogin()
hostname = getattr(os_name, 'nodename')
system = getattr(os_name, 'sysname')
machine = getattr(os_name, 'machine')
kerenal = getattr(os_name, 'release')

# CPU Information
cpu = cpuinfo.get_cpu_info()['brand_raw']
cpu_core_logical = psutil.cpu_count()
cpu_core_physical = psutil.cpu_count(logical=False)
cpu_freq_min = f"{psutil.cpu_freq().min: .2f} MHz "
cpu_freq_max = f"{psutil.cpu_freq().max: .2f} MHz "

# temp_data = psutil.sensors_temperatures()
# core0 = f"{temp_data['coretemp'][1].label} : {temp_data['coretemp'][1].current} \u00b0 C"
# core1 = f"{temp_data['coretemp'][2].label} : {temp_data['coretemp'][2].current} \u00b0 C"
# core2 = f"{temp_data['coretemp'][3].label} : {temp_data['coretemp'][3].current} \u00b0 C"
# core3 = f"{temp_data['coretemp'][4].label} : {temp_data['coretemp'][4].current} \u00b0 C"

# Core Temperature
def get_cpu_core_temperatures():
    temp_data = psutil.sensors_temperatures()
    if 'coretemp' not in temp_data:
        return "No core temperature data available."

    core_temps = temp_data['coretemp']
    result = []

    for core in core_temps:
        core_info = f"{core.label} : {core.current} \u00b0C"
        result.append(core_info)

    result.remove(result[0])
    return result

# print(get_cpu_core_temperatures())

# Boot Time
boot_time = psutil.boot_time()

# GPU Information

# gpu_temp = torch.cuda.temperature()
# gpu_memory_total = torch.cuda.memory_reserved()
# gpu_memory_used = torch.cuda.memory_allocated()
# gpu_memory_free = torch.cuda.memory_reserved() - torch.cuda.memory_allocated()

# if(torch.cuda.is_available()):
#     gpu_name = torch.cuda.get_device_name(0)
# else:
#     gpu_name = "No GPU Found"


# def get_gpu_info():
#     gpus = GPUtil.getGPUs()
#     if not gpus:
#         return "No GPU found."

#     gpu_info = []
#     for gpu in gpus:
#         info = {
#             'id': gpu.id,
#             'name': gpu.name,
#             'temperature': f"{gpu.temperature} °C",
#             'total_memory': f"{gpu.memoryTotal} MB",
#             'used_memory': f"{gpu.memoryUsed} MB",
#             'free_memory': f"{gpu.memoryFree} MB",
#             'load': f"{gpu.load * 100:.2f}%"
#         }
#         gpu_info.append(info)

#     return gpu_info

gpus = GPUtil.getGPUs()
gpu_name = ""
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
    gpu_total_memory = f"{gpu.memoryTotal} MB"
    gpu_used_memory = f"{gpu.memoryUsed} MB"
    gpu_free_memory = f"{gpu.memoryFree} MB"
    gpu_load = f"{gpu.load * 100:.2f}%"
    gpu_temp = f"{gpu.temperature} °C"


print(gpu.name)
# print(get_gpu_info())


# NVMe Temperature
nvme_temp =  f"{psutil.sensors_temperatures()['nvme'][0].current} \u00b0 C"
# print(f"NVMe Temperture: {nvme_temp}")
# Memory Information

def bytes_to_human_readable(num_bytes):
    for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
        if num_bytes < 1024.0:
            return f"{num_bytes:.2f} {unit}"
        num_bytes /= 1024.0

# ------------------------------------------------
virtual_memory_total = bytes_to_human_readable(psutil.virtual_memory().total)
virtual_memory_available = bytes_to_human_readable(psutil.virtual_memory().available)
virtual_memory_used = bytes_to_human_readable(psutil.virtual_memory().used)
# ------------------------------------------------
swap_memory_total = bytes_to_human_readable(psutil.swap_memory().total)
swap_memory_available = bytes_to_human_readable(psutil.swap_memory().free)
swap_memory_used = bytes_to_human_readable(psutil.swap_memory().used)
# ------------------------------------------------
disk_usage_total = bytes_to_human_readable(psutil.disk_usage('/').total)
disk_usage_available = bytes_to_human_readable(psutil.disk_usage('/').free)
disk_usage_used = bytes_to_human_readable(psutil.disk_usage('/').used)

def get_system_info():
    
    gpus = GPUtil.getGPUs()
    gpu_name = ""
    gpu_memory_total = ""
    gpu_memory_used = ""
    gpu_memory_free = ""
    gpu_load = ""
    gpu_temp = ""

    if not gpus:
        gpu = "No GPU found."
    else:
        gpu = gpus[0]
        gpu_name = gpu.name
        gpu_memory_total = f"{gpu.memoryTotal} MB"
        gpu_memory_used = f"{gpu.memoryUsed} MB"
        gpu_memory_free = f"{gpu.memoryFree} MB"
        gpu_load = f"{gpu.load * 100:.2f}%"
        gpu_temp = f"{gpu.temperature} °C"


    return json.dumps({
        "username": username,
        "hostname": hostname,
        "system": system,
        "machine": machine,
        "kerenal": kerenal,
        "cpu": cpu,
        "cpu_core_logical": cpu_core_logical,
        "cpu_core_physical": cpu_core_physical,
        "cpu_freq_min": cpu_freq_min,
        "cpu_freq_max": cpu_freq_max,
        "gpu_name": gpu_name,
        "gpu_memory_total" : gpu_memory_total,
        "gpu_memory_used": gpu_memory_used,
        "gpu_memory_free": gpu_memory_free,
        "virtual_memory_total": virtual_memory_total,
        "virtual_memory_available": virtual_memory_available,
        "virtual_memory_used": virtual_memory_used,
        "swap_memory_total": swap_memory_total,
        "swap_memory_available": swap_memory_available,
        "swap_memory_used": swap_memory_used,
        "disk_usage_total": disk_usage_total,
        "disk_usage_available": disk_usage_available,
        "disk_usage_used": disk_usage_used,
        
    })


def get_details():
    return json.dumps({
        "up_time": time.time() - boot_time,
        "boot_time": boot_time,
        "cup_percent": psutil.cpu_percent(),
        "core_temp": get_cpu_core_temperatures(),
        "nvme_temp": nvme_temp,

    })


# print(get_system_info())

# print(gpu_memory_total)
# print(gpu_memory_used)
# print(gpu_memory_free)

# print(f"Virtual Memory Total: {virtual_memory_total}")
# print(f"Swap Memory Total: {swap_memory_total}")
# print(f"Disk Usage Total: {disk_usage_total}")

# def get_system_info():
    

# System Temperature
# temperature_high = 0.0
# temperature_critical = 0.0
# if psutil.sensors_temperatures().get("acpitz") is not None:
#     temperatureHigh =  getattr(psutil.sensors_temperatures()['acpitz'][0], 'high')
#     temperatureCritical =  getattr(psutil.sensors_temperatures()['acpitz'][0], 'critical')

# temp_data = psutil.sensors_temperatures()
# print(f"Core Temperture:")
# print(f"{temp_data['coretemp'][1].label} : {temp_data['coretemp'][1].current} \u00b0 C")
# print(f"{temp_data['coretemp'][2].label} : {temp_data['coretemp'][2].current} \u00b0 C")
# print(f"{temp_data['coretemp'][3].label} : {temp_data['coretemp'][3].current} \u00b0 C")
# print(f"{temp_data['coretemp'][4].label} : {temp_data['coretemp'][4].current} \u00b0 C")

# nvme_temp = temp_data['nvme'][0].current

# print(f"NVMe Temperture: {nvme_temp} \u00b0 C")

# def get_cpu_core_temperatures():
#     temp_data = psutil.sensors_temperatures()
#     if 'coretemp' not in temp_data:
#         return "No core temperature data available."

#     core_temps = temp_data['coretemp']
#     result = []

#     for core in core_temps:
#         core_info = f"{core.label} : {core.current} \u00b0C"
#         result.append(core_info)

#     return result

# # Example usage
# core_temperatures = get_cpu_core_temperatures()
# for core_temp in core_temperatures:
#     print(core_temp)

# print(core_temperatures)
# ------------------------------------------------------------------------------------------------

# print(f"Username: {username}")
# print(f"Hostname: {hostname}")

# print(f"System: {system}")
# print(f"Machine: {machine}")
# print(f"Kerenal: {kerenal}")
# print("-----------------------------")
# print(f"CPU: {cpu}")
# print(f"CPU Core (Logical): {cpu_core_logical}")
# print(f"CPU Core (Physical): {cpu_core_physical}")
# print(f"CPU Frequency (Min): {cpu_freq_min}")
# print(f"CPU Frequency (Max): {cpu_freq_max}")
# print(f"Boot Time: {boot_time}")
# print("-----------------------------")
# print(f"GPU: {gpu_name}")
# print("-----------------------------")
# print(f"Virtual Memory Total: {virtual_memory_total}")
# print(f"Swap Memory Total: {swap_memory_total}")
# print(f"Disk Usage Total: {disk_usage_total}")
# print("-----------------------------")
# print(f"Temperature High: {temperature_high}")
# print(f"Temperature Critical: {temperature_critical}")
# print(f"Temperature Sensor: {psutil.sensors_temperatures()}")

