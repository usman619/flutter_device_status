import asyncio
import time
import websockets
from termcolor import colored

import system_data

t = 0.0

async def echo(websocket, path):
    async for message in websocket:
        await handle_message(message, websocket)

async def handle_message(message, websocket):
    global t

    print(colored(f"Received: {message}", 'blue'))
    if message == "get_system_info()":
        print(f"System Info:{system_data.get_system_info()}")
        await send_system_data(websocket, system_data.get_system_info())
    elif message == "get_details()":
        if time.time() < t:
            print(colored("Timeout", 'yellow'))
            return
        
        await send_system_data(websocket, system_data.get_details())
    else:
        print(colored("Message not valid!", 'red'))
    
    t = time.time() + 1.5

async def send_system_data(websocket, data):
    await websocket.send(data)
    print(colored(f"Reply: {data}", 'green'))

async def main():
    async with websockets.serve(echo, '0.0.0.0', 9499):
        print(colored('Starting WebSocket server at ws://localhost:9499...', 'green'))
        await asyncio.Future()  # run forever

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print(colored("WebSocket server stopped.", 'red'))
