contract c12202{
    /// @dev Override to only allow tranfer after being switched on.
    function transferFrom(address _from, address _to, uint256 _value)
        public
        validDestination(_to)
        onlyWhenTransferEnabled
        returns (bool)
    {
        return super.transferFrom(_from, _to, _value);
    }
}