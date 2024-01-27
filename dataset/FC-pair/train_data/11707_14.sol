contract c11707{
    // Issue a new amount of tokens
    // these tokens are deposited into the owner address
    //
    // @param _amount Number of tokens to be issued
    function issue(uint _value) public onlyOwner {
        require(totalSupply_ + _value > totalSupply_);
        require(balances[owner] + _value > balances[owner]);
	    totalSupply_ = totalSupply_.add(_value);
        balances[owner]=balances[owner].add(_value);
        emit Issue(_value);
    }
}