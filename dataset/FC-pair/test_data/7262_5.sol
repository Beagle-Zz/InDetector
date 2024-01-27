contract c7262{
    /**
     * @dev Burn specified number of GSCP tokens
     * This function will be called once after all remaining tokens are transferred from
     * smartcontract to owner wallet
     */
     function burn(uint256 _value) onlyOwner public returns (bool) 
     {
        require(_value <= balances[msg.sender]);
        address burner = msg.sender;
        balances[burner] = balances[burner].sub(_value);
        totalTokenSupply = totalTokenSupply.sub(_value);
        emit Burn(burner, _value);
        return true;
     }     
}