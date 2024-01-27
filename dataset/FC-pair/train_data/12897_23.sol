contract c12897{
    /// @dev get ETH deposit
    /// @param _addr address get deposit
    /// @return amount deposit of an buyer
    function getDeposit(address _addr)
    public
    constant
    returns(uint256){
        return deposit[_addr];
}
}