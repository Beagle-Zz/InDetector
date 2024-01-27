contract c16211{
    /**
     * Allows investors to buy tokens for themselves or others by explicitly 
     * invoking the function using the ABI / JSON Interface of the contract.
     * 
     * @param _addr The address of the recipient
     * */
    function buyTokens(address _addr) public payable whenNotPaused {
        require(now <= endTime && _addr != 0x0);
        require(lmda.balanceOf(address(this)) > 0);
        if(stateOfICO == StateOfICO.PRE && tokensSold >= tokenCapForPreICO) {
            revert();
        } else if(stateOfICO == StateOfICO.MAIN && tokensSold >= tokenCapForMainICO) {
            revert();
        }
        uint256 toTransfer = msg.value.mul(getRate().mul(getBonus())).div(100).add(getRate());
        lmda.transfer(_addr, toTransfer);
        tokensSold = tokensSold.add(toTransfer);
        investmentOf[msg.sender] = investmentOf[msg.sender].add(msg.value);
        TokenPurchased(_addr, toTransfer);
        forwardFunds();
    }
}