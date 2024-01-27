contract c16388{
    /// @dev Function to check the amount of tokens that a spender can spend
    /// @param _tokenholder Token owner account address
    /// @param _tokenspender Account address authorized to transfer tokens
    /// @return Amount of tokens still available to _tokenspender to transfer.
    function allowance(address _tokenholder, address _tokenspender) public view whenNotPaused returns (uint256) {
        require(!isFrozen(_tokenholder) && !isFrozen(_tokenspender));
        return allowances[_tokenholder][_tokenspender];
    }
}