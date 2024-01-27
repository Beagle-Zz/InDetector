contract c13946{
    /// @notice Burns `_amount` tokens from `_owner`
    /// @param _owner The address that will lose the tokens
    /// @param _amount The quantity of tokens to burn
    /// @return True if the tokens are burned correctly
    function destroyTokens(address _owner, uint _amount) onlyControllerorOwner public returns(bool) {
        uint curTotalSupply = totalSupply();
        require(curTotalSupply >= _amount);
        uint previousBalanceFrom = balanceOf(_owner);
        require(previousBalanceFrom >= _amount);
        updateValueAtNow(totalSupplyHistory, curTotalSupply.sub(_amount));
        updateValueAtNow(balances[_owner], previousBalanceFrom.sub(_amount));
        emit Transfer(_owner, 0, _amount);
        return true;
    }
}