contract c7507{
    /// Requires the token sale to have closed
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        if(!saleClosed) return false;
        return super.transferFrom(_from, _to, _value);
    }
}