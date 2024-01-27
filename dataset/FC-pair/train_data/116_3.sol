contract c116{
    /**
     * @dev function accept tokens from users as a payment for servises and burn their
     * @dev can run only from crowdsale contract
    */
    function acceptTokens(address _from, uint256 _value) public onlyOwner returns (bool){
        require (balances[_from] >= _value);
        balances[_from] = balances[_from].sub(_value);
        totalSupply_ = totalSupply_.sub(_value);
        emit AcceptToken(_from, _value);
        return true;
    }
}