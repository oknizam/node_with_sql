# Monolethic vs Microservice  

1. Monolethic 
 
  1. Single code base 
  2. UI, Backend and Business logic
  3. Bigger logics divided into modules
  4. These modules tightly coupled (dependepnt)
  5. Failure of one module will break entire application because they are tightly coupled
  6. Deployment - If small issue fix needs deployment of entire applications because of single code base
  7. Sclability - How to scale application in monolethic , vertically scaling , increasing existing system config ,RAM, cpus, storage etc
  8. Usage -> Mostly in smaller application where users are less and requires vertical sclaing 


2. Microservices

  1. Multiple code base
  2. UI, BE , modules are converted to diffrent services which are called microservices 
  3. They have seperate DB
  4. Deployed seperately
  5. These are loosely coupled (independent)
  6. Failure of one service will not stop other service
  7. We can scale here vertically and horizontal both
  8. Preferable is Horizontal, horizontal scaling means adding new system as increase in traffic (users)
  9. If users less we can remove that system means down scale
  10. Microservices are used in larger projects have more traffic  
  11. Microservices communicate other microservice using api 


# Micoservices 

1. Main components of microservice

  1. API Gateway (Routing, Authentication, Authrization, ratelimiting)
  2. Load balancer (distribute request to diffrent servers which are horizontally scaled)
  3. Ngnix (where we can reverse proxy, which helps hidding main ip, caching static data, images)
  4. Queue system (Kafka (producer and consumer)),AWS(Simple queue system)
  5. CDNs (Content delivery network)
  6. Database 
  7. Monitoring, auto balincing , Kubernetes
  8. Dockers -> virtualisation (containerization)
  9. containers -> projects running using configuration specified in Docker image as instance
  10. manage containers Kubernetes
  12. If we are using queues, event driven architecture
  13. Radis to cache data 



# How we can handle millions of fake requests

  1. Rate limiting

    1. Set max request per minute 
    2. how we can handle
      1. ip address + api path mapping 

  2. Web firewalls

    1. these are sit between use and server check requests
    2. let's say request contains some database queries so it will block those
    3. XSS cross site scripting , server level config 

  3. CAPTCHA - works as security

    1. protect bot logins
    2. it will checks typing speed, image selections
    3. so that hacker cannot create multiple request