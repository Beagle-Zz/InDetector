contract c13592{
    /**
    * @notice Get the balance of an _who address.
    * @param _who The address to be query.
    */
    function balanceOf(address _who) public view returns (uint256) {
        return balances[_who];
    }
}