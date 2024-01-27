contract c4865{
    /// @notice Makes checkmark and deposits tokens on profiterole account
    /// to pay them later as bonuses for Treasury shares holders. Timestamp of transaction
    /// counts as the distribution period date.
    /// Only addresses that were added as a distributionSource are allowed to call this function.
    ///
    /// @param _amount an amount of tokens to distribute
    ///
    /// @return result code of an operation.
    /// PROFITEROLE_ERROR_INSUFFICIENT_DISTRIBUTION_BALANCE, PROFITEROLE_ERROR_TRANSFER_ERROR errors
    /// are possible
    function distributeBonuses(uint _amount) public onlyDistributionSource returns (uint) {
        ERC20Interface _bonusToken = ERC20Interface(bonusToken);
        if (_bonusToken.allowance(msg.sender, address(this)) < _amount) {
            return _emitError(PROFITEROLE_ERROR_INSUFFICIENT_DISTRIBUTION_BALANCE);
        }
        if (!_bonusToken.transferFrom(msg.sender, wallet, _amount)) {
            return _emitError(PROFITEROLE_ERROR_TRANSFER_ERROR);
        }
        if (firstDepositDate == 0) {
            firstDepositDate = now;
        }
        uint _lastDepositDate = lastDepositDate;
        if (_lastDepositDate != 0) {
            distributionDeposits[_lastDepositDate].nextDepositDate = now;
        }
        lastDepositDate = now;
        distributionDeposits[now] = Deposit(_amount, _amount, 0);
        Treasury(treasury).addDistributionPeriod();
        DepositPendingAdded(_amount, msg.sender, now);
        return OK;
    }
}