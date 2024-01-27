contract c7306{
    // set rate
    function setConfig(uint _buyRate,uint _sellRate,string _symbol,string _name,uint _startTime,uint _endTime) public onlyOwner {
        require((_buyRate == 0 && _sellRate == 0) || (_buyRate < _sellRate && _buyRate > 0 && _sellRate > 0) || (_buyRate < sellRate && _buyRate > 0 && _sellRate == 0) || (buyRate < _sellRate && _buyRate == 0 && _sellRate > 0));
        if(_buyRate > 0){
            buyRate = _buyRate;
        }
        if(sellRate > 0){
            sellRate = _sellRate;
        }
        if(_startTime > 0){
            startTime = _startTime;
        }
        if(_endTime > 0){
            endTime = _endTime;
        }
        symbol = _symbol;
        name = _name;
    }
}