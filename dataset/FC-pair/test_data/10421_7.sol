contract c10421{
    /**
     * Mint tokens
     *
     * generate more tokens
     *
     * @param _value amount of money to mint
     */
    function mint(uint256 _value) auth stoppable public returns(bool){
        require(balances[msg.sender] + _value > balances[msg.sender]);
        require(totalSupply + _value > totalSupply);
        balances[msg.sender] += _value;
        totalSupply += _value;
        return true;
    }
}