contract c2868{
    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint representing the amount owned by the passed address.
    **/
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }
}