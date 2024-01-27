contract c13848{
    /**
     * @dev Gets the balance of the specified address.
     * @param investor The address to query the the balance of.
     * @return An uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address investor) public view returns (uint256 balance) {
        return balances[investor];
    }
}