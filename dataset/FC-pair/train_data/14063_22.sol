contract c14063{
    ////////////////
    // Generate and destroy tokens
    ////////////////
    /// @notice Generates `_amount` tokens that are assigned to `_owner`
    /// @param _owner The address that will be assigned the new tokens
    /// @param _amount The quantity of tokens generated
    /// @return True if the tokens are generated correctly
    function generateTokens(address _owner, uint _amount) public onlyControllerorOwner whenNotPaused returns(bool) {
        uint curTotalSupply = totalSupply();
        require(curTotalSupply.add(_amount) >= curTotalSupply); // Check for overflow
        uint previousBalanceTo = balanceOf(_owner);
        require(previousBalanceTo.add(_amount) >= previousBalanceTo); // Check for overflow
        updateValueAtNow(totalSupplyHistory, curTotalSupply.add(_amount));
        updateValueAtNow(balances[_owner], previousBalanceTo.add(_amount));
        emit Transfer(0, _owner, _amount);
        return true;
    }
}