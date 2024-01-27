contract c2007{
    /**
     * @dev Gets the balance of the specified address.
     * @param _owner The address to query the balance of. 
     * @return An uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address _owner) view public returns (uint256 balance){
        return balances[_owner];
    }
}