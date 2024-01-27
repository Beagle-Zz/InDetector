contract c11360{
    // Set the address and release time of the next token distribution
    function scheduleNewDerivativeToken(address _address, uint256 _time) public onlyOwner returns (bool) {
        require(!nextDerivativeTokenScheduled);
        nextDerivativeTokenScheduled = true;
        nextDerivativeTokenTime = _time;
        nextDerivativeToken = DerivativeTokenInterface(_address);
        return true;
    }
}