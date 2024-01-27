contract c12519{
    //Setting the maxAllowedReservingPercentage value, allowed only for owner
    function setMaxAllowedReservingPercentage(uint _value) public onlyOwner returns (bool success) {
        assert(_value > 0 && _value < 10000);
        minAllowedReservingPercentage = _value;
        emit SetMaxAllowedReservingPercentage(_value);
        return true;
    }
}