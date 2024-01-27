contract c12519{
    //Setting the setJackpotMinimumAmount value, allowed only for owner
    function setJackpotMinimumAmount(uint _value) public onlyOwner returns (bool success) {
        jackpotMinimumAmount = _value;
        emit SetJackpotMinimumAmount(_value);
        return true;
    }
}