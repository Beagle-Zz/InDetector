contract c4916{
    /**
        CONSTANT FUNCTIONS
    **/
    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _owner) view public returns (uint256 balance) {
        return balances[_owner];
    }
}