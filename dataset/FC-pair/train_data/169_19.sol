contract c169{
    /// @dev Trading limited
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        if(tradingOpen) {
            return super.transferFrom(_from, _to, _value);
        }
        return false;
    }
}