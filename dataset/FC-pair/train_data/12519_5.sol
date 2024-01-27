contract c12519{
    //Setting the reservingStep value, allowed only for owner
    function setReservingStep(uint _value) public onlyOwner returns (bool success) {
        assert(_value > 0);
        reservingStep = _value;
        emit SetReservingStep(_value);
        return true;
    }
}