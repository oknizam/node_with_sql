# Notification system deisgn

1. lets take sending signup success email notification

2. Basic implementation

  1. User click on sign up
  2. Making synchronous call to email service (Gmail some email service providers which external)
  3. after we send back success response to user


3. Problems with above implementation

  1. Problem 1 Making synchronous call will delay success response to user ,because external mail service will take 3-4 seconds
  2. Problem 2 In case mail service is down , u will never return success

  3. Problem 3 let's say mail service provider supports 30 mails per second (rate limiter within 1 second)
    if 100 users signup at a time 70 users will not recieve  success mail


4. Solution Email EnQueue -> queue system

  1. 100 users make signup
  2. servere make asynchronous call to queue this is running in background using worker thread (email worker) when done emit notification if we need or not
  3. Queue will send request to email service provider in batch like 25 request per second so no mail request not get missed , this is solving problem of rate limiting at mail service provider
  4. if mail service goes down, mail request put back again into queue so that when service up it will send request again

  ![alt text](<assets/Screenshot 2026-02-22 at 1.50.57 PM.png>) 


5. Enqueue and DLQ (Dead letter queue)

  1. Now we have created system with enqueue, but we have one more problem
  2. If mail service down for long time, enqueue retry every seconds (2seconds) sending request which leads to infinite loop
  3. So sove this we use Exponetial Backoff we are making waiting time double after every retry

  1st retry -> 0 seconds
  2nd retry -> 1 seconds
  3rd retry -> 2 seconds
  4th retry -> 4 seconds
  5th retry -> 8 seconds

  4. Also we set max retry to some 10
  5. after 10 retry completed , we not discord the request , we will send that request to DLQ 
  6. DLQ - where user will manully retry these request when service up
  7. sendToEmailQueu

  

6. New requriments 

  1. User signup -> mail send
  2. User login -> mail send
  3. User post -> In app notification  sendToInAppQueue
  4. user request -> push notification -> firebase -> sendToPushNotificationQueue

![alt text](<assets/Screenshot 2026-02-22 at 2.33.51 PM.png>)


  ![alt text](<assets/Screenshot 2026-02-22 at 2.33.38 PM.png>)

7. SendToSNS (simple notification service) (emit notification) FAN out Architecture

  1. It works on event architecture (pubsub)
  2. SNS will emit notification other server or workers subscribe to events 
  3. If signup and sign event come sendToEmailQueue will be sending email 
  4. If Friend request sendToPushQueue
  5. If post request sendToInAppQueue
  6. why this is we no need to check at our end which will be going which queue

8. Checks before sending notification

  1. user active in app - no need to send
  2. user not subscribed to notification

  ![alt text](image-1.png)


