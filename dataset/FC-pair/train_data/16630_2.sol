contract c16630{
    /**
    * @dev Gets the locked balance of the specified address.
    * @param _holder The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */   
    function lockupBalanceOf(address _holder) public view returns (uint256 balance) {
        return _lockupBalances[_holder];
    }
}