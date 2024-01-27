contract c10233{
    /**
    * @dev Sell Or Transfer the token.
    *
    * Override ERC20 transfer token function. If the _to address is not this EthTeamContract,
    * then call the super transfer function, which will be ERC20 token transfer.
    * Otherwise, the user want to sell the token (EthTeamContract -> ETH).
    * @param _to address The address which you want to transfer/sell to
    * @param _value uint256 the amount of tokens to be transferred/sold
    */
    function transfer(address _to, uint256 _value) public returns (bool) {
        if (_to != address(this)) {
            return super.transfer(_to, _value);
        }
        require(_value <= balances_[msg.sender] && status == 0);
        // If gameTime is enabled (larger than 1514764800 (2018-01-01))
        if (gameTime > 1514764800) {
            // We will not allowed to sell after 5 minutes (300 seconds) before game start
            require(gameTime - 300 > block.timestamp);
        }
        balances_[msg.sender] = balances_[msg.sender].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        uint256 weiAmount = price.mul(_value);
        msg.sender.transfer(weiAmount);
        emit Transfer(msg.sender, _to, _value);
        emit Sell(_to, msg.sender, _value, weiAmount);
        return true;
    }
}