contract c16022{
    /**
     * @dev Gets the locked balance of the specified address.
     * @param _owner The address to query.
     * @return Amount.
     */
    function lockedBalanceOf(address _owner) public view returns (uint256) {
        return lockedBalanceMap[_owner];
    }
}