contract c13008{
    /**
     * @dev Decrease the amount of WEDU token that allowed to the user
     * @param _spender A user who allowed WEDU token reception
     * @param _substractedValue The amount of WEDU token for decreasing
     * @return True when the amount of allowed WEDU token successfully decreases
     */
    function decreaseApproval(address _spender, uint _substractedValue) public returns (bool){
        // Check the address
        require(_spender != address(0), "Address is wrong");
        require(allowed[msg.sender][_spender] > 0, "Not approved until yet");
        // Check a user included in blacklist
        require(!blackList[msg.sender], "Sender in blacklist");
        require(!blackList[_spender], "Receiver in blacklist");
        uint oldValue = allowed[msg.sender][_spender];
        if (_substractedValue > oldValue){
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue - _substractedValue;
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}