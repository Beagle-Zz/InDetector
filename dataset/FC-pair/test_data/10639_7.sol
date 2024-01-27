contract c10639{
    /**
    * @dev Get the balance of the specified address
    *
    * @param _owner The address from which the balance will be retrieved
    * @return The balance
    */
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
}