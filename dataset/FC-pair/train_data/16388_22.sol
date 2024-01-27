contract c16388{
    /// @dev Gets balance of the specified account.
    /// @param _tokenholder Address of interest
    /// @return Balance for the passed address
    function balanceOf(address _tokenholder) public view whenNotPaused returns (uint256 balance) {
        require(!isFrozen(_tokenholder));
        return balances[_tokenholder];
    }
}