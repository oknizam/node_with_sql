1. Vertical and horizontal scaling

  1. Vertical scaling -> 
    1. upgrading existing system
    2. Single point of failure
    3. less cost

  2. Horizontal scale

    1. Adding new machine with same spec
    2. If one fails , task is  assigned to other machine
    3. also parallely multiple mahcines with sme spec wokring on  multiple task
    4. High cost

2. Clustering

  1. Runing in single process will not fast tasks
  2. so we will cretate new process based on cpu cores availability in machine
  3. all are running
  4. Issue is no auto scaling, once created its created
  5. To handle this we need PM2 (process maneger)
  6. Used  auto scale 
  7. CHeck process health
  8. Restart process if fails

  packages used : os -> to get cpus ,cluster - create new peocess



3. Load balencer

  1. used for vertical scaling to distribute request
  
4. API gateway  -> microservices

  1. handle (Routing)
  2. Middleware
  3. authentication
  4. package used : http-proxy-middleware -> function createProxyMiddleware({
    target:"http://localhost:3001",
    changeOrigin: true -> to set host header
  })

5. Ngnix (reverse proxy)

  1. Main server url is not shown
  2. Caching static content (html,css ,js, images etc)

6. caching 

  1. Radis server
  2. If request comes for same data instead of making request to db fetch from cache

7. Microservies

  1. Monolithic
    1. Monolethic (all modules in single project ex: order, payment, notification etc)
    2. which titghtly coupled
    3. if one fails , app fails
    4. deployment also changes in one module deploying entire app
    5. cost effective

  2. Microsevice
    1. Create new service for each module
    2. loosely coupled
    3. communicate via end points or event system (pub/sub)
    4. More cost
    5. Independentlyd deployed
    6. Failure in one will not break others


8. CDNs (for ither regions to get faster data)

  1. Content delivery network 
  2. example cloud fare
  3. cdn are create newr each region first retrive is deplay
  4. second time fasyter because cdn cahce content

9. Queuing system

  1. BullMq
  2. rabitmq
  3. kafka


10. Containerisation (docker)

  1. create containers for each services docker image
  2. To maintain we use kubernetes

11. if small project we use dockercomoser.yml

13. Database optimization

  1. Indexing
  2. caching
  

