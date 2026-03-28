// discount  = (actualtPrice * discount) / 100

const offers = {
  OFR001: { discount: 10, minDistance: 0, maxDistance: 200, minWeight: 70, maxWeight: 200 },
  OFR002: { discount: 7, minDistance: 20, maxDistance: 150, minWeight: 100, maxWeight: 250 },
  OFR003: { discount: 5, minDistance: 50, maxDistance: 250, minWeight: 10, maxWeight: 150 },
}

// problem1: find delivery cost

function calculateTotalDeliveryCost(baseCost, weight, distance, offerCode) {

  let deliveryCost = baseCost + (weight * 10) + (distance * 5);
  let discount = 0;
  const offer = offers[offerCode];


  if (offer && distance >= offer.minDistance && distance <= offer.maxDistance && weight >= offer.minWeight && weight <= offer.maxWeight) {
    discount = (deliveryCost * offer.discount) / 100;
  }

  return {
    discount,
    deliveryCost,
    totalCost: deliveryCost - discount
  }

}


// console.log(calculateTotalDeliveryCost(100, 10, 100, "OFR003"));


// problem2: Delivery time estimation

// best shipment function 
const packages = [
  { id: "PKG1", weight: 50, distance: 30 },
  { id: "PKG2", weight: 75, distance: 125 },
  { id: "PKG3", weight: 175, distance: 100 },
  { id: "PKG4", weight: 110, distance: 60 },
  { id: "PKG5", weight: 155, distance: 95 }
];

const vehicles = 2
const speed = 70
const capacity = 200

function getBestShipment(packages, capacity) {
  let result = [], bestWeight = 0;

  function addShipment(start, combo, totalWeight) {
    if (totalWeight > capacity) return;

    if (totalWeight > bestWeight) {
      bestWeight = totalWeight;
      result = combo;
    }

    for (let i = start; i < packages.length; i++) {
      addShipment(i + 1, [...combo, packages[i]], packages[i].weight + totalWeight)
    }
  }
  addShipment(0, [], 0)

  return result;
}


// console.log(getBestShipment(packages, capacity))


// delevery time estimation

function estimateDeliveryTime(packagesInput, vehicleCount, speed, capacity) {

  let packages = packagesInput.map((pkg) => { return { ...pkg, estimtedTime: 0 } });
  let shipments = [];

  let vehicles = new Array(vehicleCount).fill(0); // vehicles start with 0

  while (packages.length > 0) {
    let earliestTime = Math.min(...vehicles);
    let vehicalIndex = vehicles.indexOf(earliestTime); // find earliest available vehicle

    let shipment = getBestShipment(packages, capacity);

    let longestTravelTime = 0;

    for (let pkg of shipment) {
      let travelTime = pkg.distance / speed;
      pkg.estimtedTime = parseFloat(
        earliestTime + travelTime
      ).toFixed(2);

      // longest travel time

      if (travelTime > longestTravelTime) {
        longestTravelTime = travelTime
      }

    }

    vehicles[vehicalIndex] = earliestTime + (2 * longestTravelTime); //update vehicle avilability

    // console.log("vehicle avilable", vehicles[vehicalIndex])

    // remove delivered packges

    packages = packages.filter((pkg) => !shipment.map((ship) => ship.id).includes(pkg.id));

    shipments = [...shipments, shipment];

  }
  return shipments;
}

// console.log(estimateDeliveryTime(packages, vehicles, speed, capacity))


const http = require("http");

http.createServer((_req, res) => {
  res.writeHead(200, {
    "Content-Type": "Application/json"
  });
  res.end(JSON.stringify({ message: "server is running" }))
}).listen(3000)