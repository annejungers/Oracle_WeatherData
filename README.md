# Oracle_WeatherData
Lab for Howest: push-based oracle

## Intro

For the purposes of this work, we have used [Defender Openzeppelin](https://defender.openzeppelin.com/). 
Openzeppelin Defender is a platform for securing and automating smart contrant

The oracle contract uses a Relayer from Openzeppelin Defender.
The Relayer is responsible to provide the data weather from the **OpenWeatherData API** and act as an oracle by updating it every single minutes.
Most of the contract logic, like the function **getWeatherData()** is performed on Openzeppelin Defender in a javascript file.
--> It is a good illustration of ***how to move the business logic off-chain and use less gas in Solidity***.


we add as information:
- the ABI of the contract (that we have in remix)
- the contract address
- the function getWeatherData that calls the weather API
to deploy the contract we can only use the relayer address 0x6e9542da1a2a61363a555344fe13a1f463ffbfd8


## Tasks
For this lab we will be making a push based oracle providing weather services.
The oracle must provide a function that retrieves weather data for a given city.

The city in this case is ***Brussels 50.85 lat 4.35 long***

##  Requirements:

+ A weather service deploys the oracle and regularly submits new weather data
++ tip: use 2 arrays, one for city names, one for data in a list
+ Only the newest data is kept, no need  to store  historic data in the smart contact
+ There is a way to retrieve weather data about a certain city by name
+ Weather data includes:
++ temperature (in C°, no digits after the comma)
++ Wind power (in km/h, no digits after the comma, max 500 km/h)
++ Chance of rain ( a percentage, no digits after the comma)
++ Wind direction (one of N, NE, E, SE, SW, W, NW)
+ There is a way to retrieve how old the weather data is for a specific city

*RK: in this project we will finally only focus on building a simple oracle and only get the **weatherData temperature** . *

## Tools used

+ [Openzeppelin Defender](https://defender.openzeppelin.com/)
+ [Remix IDE](https://remix.ethereum.org/)
+ [Open Weather Data API](https://openweathermap.org/)

## Steps

### Write contract on Remix IDE 
Only the address of the Relayer can provide information in this smart contract.

### Create a Relayer on Defender Openzeppelin 
and choose Goerli testnet
![](https://gateway.pinata.cloud/ipfs/QmU7kJAPRnfXsQgiSUiZGFSxuQ8irwD7xuBgmCCPaZZGc3)


### Create an Autotask in Openzeppelin Defender
Yu can schedule the autotask to renew the weather data every minute
![](https://gateway.pinata.cloud/ipfs/QmX1aHytMkGBXzQMNx8Nqxxo8eBA31Y86t57Dpnd1m46Ef)

Then, we add the following information in the **autotask.js** file:
- the ABI of the contract (that we have in remix)
- the contract address
- the function getWeatherData that calls the weather API where we can add:
   the key API and the lat and long of Brussels
- the getWeatherData() function which tries to call the weather API
![](https://gateway.pinata.cloud/ipfs/QmSqX6v9utdAghybK9aD9ptBuwvqtLXPz8tYjHgsy6D8Jn)

### Deploy smart contract by selecting injecting provider (Metamask)
and add the relayer address
![](https://gateway.pinata.cloud/ipfs/QmVtNrWhgjDWgLGv2Wzxu5FbFb46ysEFg9m5fykWULKXax)

confirm transaction with Metamask
![](https://gateway.pinata.cloud/ipfs/QmSL4qEzkrQGvcirmdkq1zFGoUZFMgMurBrh34YhqyK7Gy)


### Set up the parameters in Autotask.js
Once the contract is deployed, copy the contract address and the contract ABI in the autotask.js 
![](https://gateway.pinata.cloud/ipfs/QmXfS824j4CBEJH9bWtwonRGgVpzZRGVX4ZG2HdEu4J9D2)




### Make sure that you have test Ether on your Relayer to run the Autotask every 1 minute
So that the temperature will be updated every 2 minutes



