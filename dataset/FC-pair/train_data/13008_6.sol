contract c13008{
    /**
     * @dev Educo-op transfers the WEDU token to a user
     * @param _to The user who will receive WEDU token
     * @param _value The amount of WEDU token transmits to a user
     * @return True when the WEDU token transfer success
     */
    function privateTransfer(address _to, uint _value) public onlyOwner returns (bool) {
        // Check the address
        require(_to != address(0), "Address is wrong");
        // Account balance validation
        require(_value <= balanceValue[owner].unlocked, "Unsufficient balance");
        require(balanceValue[_to].unlocked <= balanceValue[_to].unlocked + _value, "Overflow");
        uint previousBalances = balanceValue[owner].unlocked + balanceValue[_to].locked;
        balanceValue[owner].unlocked -= _value;
        balanceValue[_to].locked += _value;
        emit Transfer(msg.sender, _to, _value);
        assert(balanceValue[owner].unlocked + balanceValue[_to].locked == previousBalances);
        return true;
    }
}