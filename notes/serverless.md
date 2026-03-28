# server based
  1. Serverless vs server based
  2. I am using AWS cloud services
  3. I have BE project (node server) 
  4. I want to deploy into aws cloud service
  5. What i will do , i will create ec2 instance of medium config 
  6. I will deploy my code 
  7. In my application users actively using application (traffic high in my application morning 10AM - 10PM - 12 Hours) 1000 active users
  8. From 10pm - 9AM 11 Hours less users 10 active users
  9. My system is scaled to handle 1000 active users 12gb ram, 8 cpu cores + 1TB hd(DB) - always active
  10. Cost for my machine 1 hour 2$  -> 24 Hours -> 2 * 48 = 96$ -> monthly 96 * 30 -> 2800 * 12
  11. If i am not using my machine for 10 hours still i getting charged
  12. Disadvantage of Server based


# Serverless 

  1. We don't need to create app, simply we need to write functionality
  2. AWS provide one service called lambda function
  3. You can write code in any launguage 
  4. you can create an api to trgger that function, multiple ways u can trigger this
  5. Advantage is they will charge only when this function is hit, and also cost very less
  6. No need to take care of scaling , aws autometically scaling when user increases
  7. how lamda works
  8. When this got trgggred , initially it is in sleep, it takes time to start, cold start when ur not used system from last 2 days
  9. This is an disadvantage
  10. user vendor lock (aws) if he want to switch other cloud services it is difficult
  11. to run server less local machine , serverless platform , where you can ur code , deploy code through command line  

  12. It is stateless
