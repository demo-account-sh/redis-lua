local plane_idendifier = KEYS[1]
local plane_parking_space = redis.call('GET', plane_idendifier)

-- If the plane is already assigned to a parking space return message.
if plane_parking_space then
    return "Parking space '"..plane_parking_space.."' alredy reserved for plane '"..plane_idendifier.."'."
end

-- I'm using an increment to fill the parking space.
-- If it's really required to get the values randomly I would
--   1. set a list in redis with parking spots ([0, 1, 2, 3, ...]),
--   2. generate a random number from 0 to list length
--   3. pop the value at the randomed value
--   4. assign that number to plane
local parking_space = redis.call('INCR', 'parking_spot_counter') -- Increment counter for parking space
if parking_space > 100 then -- Alternativelly we could set the parking space limit in redis and call it here.
    return  'Out of parking space!'
end

redis.call('SET', plane_idendifier, parking_space)
return "Reserved parking space '"..parking_space.."' for plane '"..plane_idendifier.."'."
