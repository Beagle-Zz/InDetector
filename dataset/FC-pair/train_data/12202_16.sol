contract c12202{
    /// @dev Override to only allow tranfer after being switched on.
    function transfer(address _to, uint256 _value)
        public
        validDestination(_to)
        onlyWhenTransferEnabled
        returns (bool)
    {
        return super.transfer(_to, _value);
    }
}