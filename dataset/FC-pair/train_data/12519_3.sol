contract c12519{
    //Setting the minAllowedReservingPercentage value, allowed only for owner
    function setMinAllowedReservingPercentage(uint _value) public onlyOwner returns (bool success) {
        assert(_value > 0 && _value < 10000);
        minAllowedReservingPercentage = _value;
        emit SetMinAllowedReservingPercentage(_value);
        return true;
    }
}