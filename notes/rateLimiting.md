1. Create rate limiter middleware for api (429 sttau code too many requests)
2. Functional requirement 
  1. We need to handle 10 request per minute from same ip and for same route (window)
  2. For same Route

3. Take window limit  - 10 
4. window time - 1 miniute (60 * 1000)
5. Maintaining ip and route (path) api apth
6. Data strucure is map to have unique values
7. key will be -> ip + path
8. startTime -> current time
9. !map[key] -> {count:1, startTime:currenttime}
10. else 

    1. timeDiff = currentTime = map[key].startTime;
    2. if timeDiff > windowTime

      reseting window
      {count:1, startTime:currenttime}

  3. else

      map[key].count += 1;


11. If(map[key].count>limit) 

    return 429 status

12. Two techinues used here

    1. Fixed window
    2. Sliding window

    1. Fixed window what we implemented

    2. sliding window 

      we are keeping at what time request is came and filtering out old request which are <  window_time
    