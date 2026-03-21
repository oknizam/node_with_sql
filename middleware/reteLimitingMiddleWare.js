
const map = {}, slideMap = {}, LIMIT = 5, WINDOW_TIME = 60 * 1000;
async function rateLimitingFixedWindow(req, res, next) {
  try {
    const { path, ip } = req;
    const key = `${path}-${ip}`;
    const currentTime = new Date();

    if (!map[key]) {
      map[key] = {
        count: 1,
        startTime: currentTime
      }
    }
    else {
      const timeDiff = currentTime - map[key].startTime;

      if (timeDiff > WINDOW_TIME) {
        map[key] = {
          count: 1,
          startTime: currentTime
        }
      }
      else {
        map[key].count += 1;
      }
    }

    if (map[key].count > LIMIT) {
      return res.status(429).json({ message: "Too many request" })
    }

    next();
  }
  catch (err) {
    console.log("error in rate limit function", err)
    return res.status(500).json("something went wrong please try later")
  }
}


async function rateLimitingSlidingWindow(req, res, next) {
  try {
    const { ip } = req;
    const currentTime = new Date();

    if (!slideMap[ip]) {
      slideMap[ip] = []
    }

    slideMap[ip] = slideMap[ip].filter((timestamp) => currentTime - timestamp < WINDOW_TIME);

    if (slideMap[ip] >= LIMIT) {
      return res.status(429).json({ message: "Too many request" })
    }

    slideMap[ip].push(currentTime);
    next()
  }
  catch (err) {
    console.log("error in rateLimitingSlidingWindow function", err)
  }
}


module.exports = { rateLimitingFixedWindow, rateLimitingSlidingWindow };