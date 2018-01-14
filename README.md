# Plane Parking

Lua script for assigning parking space to airplanes in redis database.

## Executing the script

In your terminal start redis server:

```bash
redis-server
```
In a separate tab run:

```bash
redis-cli --eval {dir_path}/redis-parking-script.lua {plane_id}
```
Replace: 
* {dir_path} with the path to the script
* {plane_id} with the airplane identifier
