contract c13008{
    /**
     * @dev Lock the WEDU token in users
     * @param _who The user for locking WEDU token
     * @param _value The amount of locking WEDU token
     */
    function lockBalance(address _who, uint _value) public onlyOwner {
        // Check the unlocked balance of a user
        require(_value <= balanceValue[_who].unlocked, "Unsufficient balance");
        uint totalBalanceValue = balanceValue[_who].locked + balanceValue[_who].unlocked;
        balanceValue[_who].unlocked -= _value;
        balanceValue[_who].locked += _value;
        assert(totalBalanceValue == balanceValue[_who].locked + balanceValue[_who].unlocked);
    }
}