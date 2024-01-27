contract c13008{
    /**
     * @dev Receive the WEDU token from other user
     * @param _from The users who will transmit WEDU token
     * @param _to The users who will receive WEDU token
     * @param _value The amount of WEDU token transmits to user
     * @return True when the WEDU token transfer success
     */
    function transferFrom(address _from, address _to, uint _value) public returns (bool){
        // Check the unlocked balance and allowed balance of a user
        require(allowed[_from][msg.sender] <= balanceValue[_from].unlocked, "Unsufficient allowed balance");
        require(_value <= allowed[_from][msg.sender], "Unsufficient balance");
        allowed[_from][msg.sender] -= _value;
        return _transfer(_from, _to, _value);
    }
}