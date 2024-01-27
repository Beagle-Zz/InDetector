contract c13795{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferToLimited(address _from, address _to, uint _amount, uint8 _limitType) internal {
        require((_limitType >= limitTeamType) && (_limitType <= limitBranchType));
        require((limited_balances[_to].limitType == 0) || (limited_balances[_to].limitType == _limitType));
        doTransfer(_from, _to, _amount);
        uint previousLimitedBalanceInitial = limited_balances[_to].initial;
        require(previousLimitedBalanceInitial + _amount >= previousLimitedBalanceInitial); // Check for overflow
        limited_balances[_to].initial = previousLimitedBalanceInitial + _amount;
        limited_balances[_to].limitType = _limitType;
    }
}