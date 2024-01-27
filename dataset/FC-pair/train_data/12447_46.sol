contract c12447{
    /**
     * 
     * function sellFci
     * only controller can execute in phare running
     */
    function sellFci(address _seller, uint _valueFci) onlyController public {
        // require fci is Running
        require(isPause == false && now < timeExpires);
        // require buyer not is 0x0 address
        require(_seller != 0x0);
        require(_valueFci * priceFci > fciDecimals);
        uint nacReturn = (_valueFci.mul(priceFci))/fciDecimals;
        // destroy fci
        balanceOf[address(this)] = balanceOf[address(this)].sub(_valueFci);
        totalSupply = totalSupply.sub(_valueFci);
        // update NETF balance
        NetfBalance = NetfBalance.sub(nacReturn);
        // send NAC
        NamiCrowdSale namiToken = NamiCrowdSale(NamiAddr);
        namiToken.transfer(_seller, nacReturn);
        emit Transfer(_seller, address(this), _valueFci);
        emit SellFci(_seller, nacReturn, _valueFci, now);
    }
}