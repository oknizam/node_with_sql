# whatsapp/ facebook system design

# Functional requirements
1. one - one chat
2. Grop chat
3. Sent + deliver + read recipt (double tick)
4. Online / last seen
5. Notifications
6. Share multimedia


# Non functional requirements

1. low latency ( latency means when client send request to server for some query time taken from client to process that request and send response time -> client request time + response time => latency)
2. High reliability -> system consistently works correctly and does not fail frequently, event under stress, failure or unexpected conditions
  1. works most of the time
  2. if failure , recover quickely
  3. prevent failure from affected users
3. High availability -> system should be available almost all the time 99.99%
4. Support for mobile and desktop
5. system should have storage for chat history
6. Huge amount of data (text, image, audio, video) blob data
7. End to end encryptions 
8. web sockets
9. keep in mind user A and user B connected to diffrent server , details will stored in session service


# capacity planning

1. Total active users 500M
2. 30 messages per day average
3. total messages -> 500 * 30 -> 1500M -> 1.5B
4. messages per day => 1.5B / 3600 * 24
5. 18k messages per second



# api end points

1. send message (sender_id, reciever_id, message)
2. get message (user_id,screen_size,before_timestamp)

# services

1. message service
2. group service
3. session service
4. relay service
5. last seen service (status service)
6. assets service (multi media)

# how high level services works

  1. userA and userB connected to server message service
  2. userA sends message to userB , message service send request to sesson service
  3. Session service maintain no sql data of user session (sessionId, userid)
  4. Session service check user logged (online) in app or offline
  5. If user A online send message to user B
  6. If user A is offline then message is saved in relay service 
  7. messages any how saved in database no sql (no relation) mongodb
  8. also messages can be stored in queues for temporary
  9. when user get active ssytem checks any pending messages for user
  10. send those messages to user B
  11. status service where last seeen timestamp and  user status is saved
  12. Assets service (multi media files)
  13. users are connected via open network (websocket) always on connection
  14. group message service

# group message service

  1. Relational DB (Mysql)
  2. users table (user_id PK, name, status (online/offline))
  3. groups table (group_id PK, name, created_at)
  4. group members table - mapping users to groups (id PK, user_id FK, group_id FK, joined_at)
  5. message table (id PK, sender_id, group_id FK, content, createdAt )
  6. message status table (id PK, message_id FK, user_id FK, status (sent, delivered, read), deliver_at, readt_at)


# Flow group messsages

1. sender sends messages
  message insert into message table

2. get all group members from group id

  select user_id from group_members where group_id = 1;

3. create message status entries

  Insert into message_status (message_id, user_id, status)

  values (..., 1, "sent")
  values (..., 2, "sent")
  values (..., 3, "sent")

4. Deliver messages 

  1. if user online send immidiately
  2. offline store in db

5. update status

  1. read / delivered

6. when user comes online he make request any pending messages server checks and update messages