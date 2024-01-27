contract c12447{
    /**
     * before buy users need to place buy Order
     * function buy fci
     * only controller can execute in phrase running
     */
    function buyFci(address _buyer, uint _valueNac) onlyController public {
        // require fci is Running
        require(isPause == false && now < timeExpires);
        // require buyer not is 0x0 address
        require(_buyer != 0x0);
        require( _valueNac * fciDecimals > priceFci);
        uint fciReceive = (_valueNac.mul(fciDecimals))/priceFci;
        // construct fci
        balanceOf[_buyer] = balanceOf[_buyer].add(fciReceive);
        totalSupply = totalSupply.add(fciReceive);
        NetfBalance = NetfBalance.add(_valueNac);
        emit Transfer(address(this), _buyer, fciReceive);
        emit BuyFci(_buyer, _valueNac, fciReceive, now);
    }
}