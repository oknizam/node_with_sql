# CORS -> CROSS ORIGIN RESOURCE SHARING 

1. Main purpose of CORS is preventing request from fiffrent origins 

2. Example: 
facebook.com -> origin 1 -> loggedIn -> fetch friends
oknizam.dev -> orgin 2 -> make request to facebook from oknizam.dev origin  so this is security issue to prevnt this CORS is introduced

3. What is origin in browser

  It is tuple -> (Scheme + HOST + PORT) => (http/https + oknizam.dev + 8899)

4. Same origins

    https://oknizam.dev/a
    https://oknizam.dev/b
    https://oknizam.dev/c

5. Diffrent origins

    http://oknizam.dev -> diffrent from  https://oknizam.dev

    https://api.oknizam.dev -> diffrent from  https://oknizam.dev

6. Default policy 
   
   Same-Origin -> request can send to only  https://oknizam.dev 

   diffrent origin ->  https://app.oknizam.dev not allowed 

   But this app.oknizam.dev origin is pointing to BE server , we need to allow this



7. Then how can we allow diffrent origin

  1. To allow diffrent origin BE will send a response header "Access-Control-Allow-Origin "
  2. simply our request 

      Request header {
        origin : "https://oknizam.com"
      }

  3. to allow BE will send

     Response header {
        Access-Control-Allow-Origin : "https://oknizam.com"
    }

   
  4. Allow all origins  -> not preferable
   Response header {
        Access-Control-Allow-Origin : "*"
    }

  5. If we are communicating with other origin cookies are not sent

    cred: include  -> another response header

  6. CORS will through error for GET AND POST methods

  6. PATCH, DELETE, PUT -> CORS ERROR WILL NOT THROGH

    In this case browser send preflight request to check allow diffrent origin
