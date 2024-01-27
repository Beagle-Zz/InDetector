contract c13084{
    /**
     * @dev Increase the total amount of WEDU token
     * @param _value The amount of WEDU token for increasing
     * @return True when the amount of total WEDU token successfully increases
     */
    function tokenIssue(uint _value) public onlyOwner returns (bool) {
        require(totalSupplyValue <= totalSupplyValue + _value, "Overflow");
        uint oldTokenNum = totalSupplyValue;
        totalSupplyValue += _value;
        balanceValue[owner].unlocked += _value;
        emit ChangeNumberofToken(oldTokenNum, totalSupplyValue);
        return true;
    }
}