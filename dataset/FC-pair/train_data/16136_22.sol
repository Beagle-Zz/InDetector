contract c16136{
    // Get amount of tokens
    // @param value weis paid for tokens
    function getTokenAmount(uint256 _value) internal view returns (uint256) {
        return _value.mul(rate);
    }
}