contract c13008{
    /**
     * @dev Transfer the WEDU token
     * @param _from The user who will transmit WEDU token
     * @param _to The user who will receive WEDU token
     * @param _value The amount of WEDU token transmits to user
     * @return True when the WEDU token transfer success
     */
    function _transfer(address _from, address _to, uint _value) internal returns (bool){
        // Check the address
        require(_from != address(0), "Address is wrong");
        require(_from != owner, "Owner uses the privateTransfer");
        require(_to != address(0), "Address is wrong");
        // Check a user included in blacklist
        require(!blackList[_from], "Sender in blacklist");
        require(!blackList[_to], "Receiver in blacklist");
        // Check the unlocked balance of a user
        require(_value <= balanceValue[_from].unlocked, "Unsufficient balance");
        require(balanceValue[_to].unlocked <= balanceValue[_to].unlocked + _value, "Overflow");
        uint previousBalances = balanceValue[_from].unlocked + balanceValue[_to].unlocked;
        balanceValue[_from].unlocked -= _value;
        balanceValue[_to].unlocked += _value;
        emit Transfer(_from, _to, _value);
        assert(balanceValue[_from].unlocked + balanceValue[_to].unlocked == previousBalances);
        return true;
    }
}