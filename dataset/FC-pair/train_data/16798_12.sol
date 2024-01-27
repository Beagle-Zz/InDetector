contract c16798{
    /*
    ** @dev Check TXs value is within limits:
    */
    function withinLimits(uint _value) public view returns(bool) {
        if (maxBuy != 0) {
            return (_value >= minBuy && _value <= maxBuy);
        }
        return (_value >= minBuy);
    }
}