1. Functional requirements
  1. 1:1 communictaion
  2. group message
  3. online/ offline
  4. typing show
  5. message history
  6. message status

2. non functional

  1. how we handle users increase scaling
  2. realibale message delivery


3. client side make request (web/mobile)
4. server load balancer (server A, server B, server C)
5. Node js server (socket.IO)
6. client connect to socket by sending token
7. server verifies and send back acknowledge
8. user/ client send sms  {to:"user2",message:"hello"}
9. Make entry in db (mongo db) 
10. send message to user2 after saing in db
11. problem with this approach , we have server A, B and C
12. user 2 connected to server B not A server 2 will loss data
13. we use radis as pub/sub (event)
14. event will emit to radis server data will be stored in radis
15. user2 subscribe to event from server B and get that data

    import { createAdapter } from "@socket.io/redis-adapter";

    io.adapter(createAdapter(pubClient, subClient));
    
    used to achive pub/sub

16. DB design

    1. senderID
    2. recieverId
    3. message
    4. createdAt
    5. _id
    6. status: sent, delivered, read

17. Acknowledgement

    after emit message to user 2 -> in response of socket we will get ack then update status to delivered

    socket.emit("recive_message",msg,(ack)=>{

    })

18. online/ offlien 

    updating status on socket event of user when status updated

    radis.set("used:to","online")

19. typing

    socket.on("typing",({to})=>{
      socket.to(`user:${to}`).emit("typing");
    })

20. group

    1. create group id
    2. send id to users who want join
    3. join to group
    4. message emit to group id so all users can see
