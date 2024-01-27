contract c13946{
    /// @dev This is the actual transfer function in the token contract, it can
    ///  only be called by other functions in this contract.
    /// @param _from The address holding the tokens being transferred
    /// @param _to The address of the recipient
    /// @param _amount The amount of tokens to be transferred
    /// @return True if the transfer was successful
    function doTransfer(address _from, address _to, uint _amount) internal {
        if (_amount == 0) {
            emit Transfer(_from, _to, _amount); // Follow the spec to louch the event when transfer 0
            return;
        }
        // Do not allow transfer to 0x0 or the token contract itself
        require((_to != 0) && (_to != address(this)));
        // If the amount being transfered is more than the balance of the
        //  account the transfer throws
        uint256 previousBalanceFrom = balanceOfAt(_from, block.number);
        require(previousBalanceFrom >= _amount);
        //  sending the tokens
        updateValueAtNow(balances[_from], previousBalanceFrom - _amount);
        // Then update the balance array with the new value for the address
        //  receiving the tokens
        uint256 previousBalanceTo = balanceOfAt(_to, block.number);
        require(previousBalanceTo.add(_amount) >= previousBalanceTo); // Check for overflow
        updateValueAtNow(balances[_to], previousBalanceTo.add(_amount));
        // An event to make the transfer easy to find on the blockchain
        emit Transfer(_from, _to, _amount);
    }
}