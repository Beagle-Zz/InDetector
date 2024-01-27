contract c11707{
    // Redeem tokens.
    // These tokens are withdrawn from the owner address
    // if the balance must be enough to cover the redeem
    // or the call will fail.
    // @param _amount Number of tokens to be issued
    function redeem(uint _value) public onlyOwner {
        require(totalSupply_ >= _value);
        require(balances[owner] >= _value);
        totalSupply_ = totalSupply_.sub(_value);
        balances[owner]=balances[owner].sub(_value);
        emit Redeem(_value);
    }
}