contract c16433{
    // Get real value to return to investor
    function getRealValueToReturn(uint256 _value) internal view returns(uint256) {
        return _value.mul(restWei).div(weiRaised);
    }
}