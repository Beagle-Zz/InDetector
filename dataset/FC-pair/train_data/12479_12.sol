contract c12479{
    // low level token purchase function
    function buyTokens(address beneficiary) public payable {
        require(canBuy && msg.value >= (0.00001 ether));
        require(beneficiary != address(0));
        uint256 _amount = msg.value.mul(decimal_num).div(1 ether);
        totalSupply = totalSupply.add(_amount);
        require(totalSupply <= cap || projectFailed);
        balances[beneficiary] = balances[beneficiary].add(_amount);
        TokenPurchase(msg.sender, beneficiary, _amount);
        // send ether to the fund collection wallet
        if (!projectFailed) {
            owner.transfer(msg.value);
        }
    }
}