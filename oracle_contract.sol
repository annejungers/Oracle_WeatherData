pragma solidity >= 0.7.0 < 0.9.0;

/*
push based oracle
*/

 /*
This contract is made with a relayer in https://defender.openzeppelin.com/
The relayer is responsible to provide the data weather and act as an oracle.
Most of the contract logic, like the function getWeatherData() is performed on Openzeppelin Defender
It is a good illustration of how to move the business logic off-chain and use less gas in Solidity

 */
import "@openzeppelin/contracts/access/Ownable.sol";

contract WeatherDataProvider is Ownable {
    
    // the oracle sources the data temperature which is th data we are going to watch
    int temperature;
    // we create relayer in Openzeppelin Defender, which is responsible for updating the data
    address private relayer;
    uint decimals = 4;

    constructor(address _relayer) {
        setRelayer(_relayer);
    }

    function updateTemperature(int temp) onlyRelayer public {
        temperature = temp;
    }

    function getTemperature() public view returns(int) {
        return temperature;
    }

    function getRoundedTemperature() public view returns(int) {
        return temperature / int(10**decimals);
    }

    function getRelayer() public view returns(address) {
        return relayer;
    }

    function setRelayer(address _relayer) onlyOwner public {
        relayer = _relayer;
    }

    function setDecimals(uint _decimals) onlyRelayer public {
        decimals = _decimals;
    }

    function getDecimals() public view returns(uint) {
        return decimals;
    }

    // we make sure that only the address that we provide for the relayer in openzeppelin
    // can provide/change the information (also see modifier below)
    function _checkRelayer() internal view virtual {
        require(relayer == msg.sender, "Caller is not the relayer");
    }

    modifier onlyRelayer {
        _checkRelayer();
        _;
    }




}