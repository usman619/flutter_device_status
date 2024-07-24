import asyncio
import time
import websockets
import daemon
from termcolor import colored

import system_data

t = 0.0

async def echo(websocket, path):
    async for message in websocket:
        await handleMessage(message, websocket)

async def handleMessage(message, websocket):
    global t

    print(message)
    if(message == "get_system_info()"):
        await sendSystemData(websocket, system_data.get_system_info())
    elif(message == "get_details()"):
        if(time.time() < t):
            print("Timeout")
            return
        
        await sendSystemData(websocket, system_data.get_details())
    else:
        print(colored("message not valid!", 'red'))
    
    t = time.time() + 1.5

async def sendSystemData(websocket, data):
    await websocket.send(data)
    print(colored("Reply: " + data, 'green'))

def run_daemon():
    asyncio.get_event_loop().run_until_complete(
        websockets.serve(echo, '0.0.0.0', 9499))
    asyncio.get_event_loop().run_forever()

print(colored('Starting websocket server at ws://localhost:9499...', 'green'))
print()
print('to cancel this process:')
print('get the pid with: ' + colored('ps axuw | grep server_listener.py', 'cyan'))
print('run: ' + colored('kill <pid>', 'cyan'))

with daemon.DaemonContext():
    run_daemon()