contract c16028{
    /**
     * @dev Gets the balance of the specified address.
     * @param _owner The address to query the the balance of.
     * @return Amount.
     */
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
}