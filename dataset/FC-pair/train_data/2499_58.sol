contract c2499{
    /**
     * @notice Burn function used to burn the securityToken
     * @param _value No. of token that get burned
     */
    function burn(uint256 _value) checkGranularity(_value) public {
        adjustInvestorCount(msg.sender, address(0), _value);
        require(tokenBurner != address(0), "Token Burner contract address is not set yet");
        require(verifyTransfer(msg.sender, address(0), _value), "Transfer is not valid");
        require(_value <= balances[msg.sender], "Value should no be greater than the balance of msg.sender");
        adjustBalanceCheckpoints(msg.sender);
        adjustTotalSupplyCheckpoints();
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure
        balances[msg.sender] = balances[msg.sender].sub(_value);
        require(tokenBurner.burn(msg.sender, _value), "Token burner process is not validated");
        totalSupply_ = totalSupply_.sub(_value);
        emit Burnt(msg.sender, _value);
        emit Transfer(msg.sender, address(0), _value);
    }
}