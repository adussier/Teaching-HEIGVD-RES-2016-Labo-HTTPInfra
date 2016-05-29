// express.js
var express = require('express');
var app = express();

// chance.js
var Chance = require('chance');
var chance = new Chance();

// port used for web server
var port = 3000;

function generateAddresses() {
	var numberOfAddresses = chance.integer({
		min: 1,
		max: 10
	});
	console.log('Number of addresses : ' + numberOfAddresses);
	
	var addresses = [];
	for (var i = 0; i < numberOfAddresses; i++) {
		addresses.push({
			address: chance.address(),
			areacode: chance.areacode(),
			city: chance.city(),
			country: chance.country(),
			coordinates: chance.coordinates()
		});
	}
	console.log(addresses);
	return addresses;
}

// GET on default url
app.get('/', function (req, res) {
  res.send(generateAddresses());
});

// start web server
app.listen(port, function () {
  console.log('Start listening on port ' + port);
});