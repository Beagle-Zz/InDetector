contract c16630{
    /**
    * @dev Gets the balance of the specified address.
    * @param _holder The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _holder) public view returns (uint256 balance) {
        return _balances[_holder].add(_lockupBalances[_holder]);
    }
}