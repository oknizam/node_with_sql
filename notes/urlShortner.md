check code here: oknizam/url_shorten.git 

1. How we store url in database 
2. Data structure we used to store Map (key, value) pair
3. How you generate Shortid 
4. we use base62 encode to generate shortid
5. base62 works it has 0-9 numbers , a-z letter lower case and A-Z  letters Upper case
6. base = "0-9a-zA-Z";

function getShortId(num){
  let encode = '';

  while(num>0){
    encode = base[num % base.length] + encode;
    num = Math.floor(num/10)
  }

  return encode;

7. we insert this actual url aginst shortId which is key

    1. How we store
    {
      "0":"https://abc.com",
      "1":"https://xyz.com",
    }

    db.urls.insertOne({
      shortId,
      url: "https://xyz.com",
      expiresAt: timing
    });

    2. short url returned user

      shortUrl = host + shortId

              = "https://shortly.com/1" + 

    return res.status(200).json({
      shortUrl : "https://shortly.com/1"
    })

8. How redirection happens

    1. get request call to server with shortId = 1
    2. make request to db get data
    3. check expiry expiryAt > currentDateTime 
    4. redirect to main url 

      res.redirect(actual_url);

    5. else case delete entry in db  for expiry and return response short id is expired

9. main part is how you maintain sequence

  db.counter.findOneAndUpdate({
      {_id:"url_shortner"},
      {$inc:{seq:1}},
      { new: true, upsert:true}
    })
  }

  1. upsert menas update document if exist otherwise create new one
  
  this will give me new sequence everytime