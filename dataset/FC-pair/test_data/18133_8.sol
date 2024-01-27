contract c18133{
    /// @dev Gets totalSupply
    /// @return Total supply
    function totalSupply()
    public
    constant
    returns (uint256) {
        return _totalSupply;
    }
}