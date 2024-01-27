contract c1911{
    /// @notice Withdraws deposited tokens on behalf of users
    /// Allowed only for oracle
    ///
    /// @param _userKey aggregated user key (user ID + role ID)
    /// @param _value an amount of tokens that is requrested to withdraw
    /// @param _withdrawAddress address to withdraw; should not be 0x0
    /// @param _feeAmount amount of tokens that will be taken from _value as fee
    /// @param _feeAddress destination address for fee transfer
    ///
    /// @return result of an operation
    function withdraw(bytes32 _userKey, uint _value, address _withdrawAddress, uint _feeAmount, address _feeAddress) external onlyOracle returns (uint) {
        require(_userKey != bytes32(0));
        require(_value != 0);
        require(_feeAmount < _value);
        _makeWithdrawForPeriod(_userKey, _value);
        uint _periodsCount = periodsCount;
        user2lastPeriodParticipated[_userKey] = periodsCount;
        delete periods[_periodsCount].startDate;
        ERC20 _token = ERC20(token);
        if (!(_feeAddress == 0x0 || _feeAmount == 0 || _token.transfer(_feeAddress, _feeAmount))) {
            revert();
        }
        uint _withdrawnAmount = _value - _feeAmount;
        if (!_token.transfer(_withdrawAddress, _withdrawnAmount)) {
            revert();
        }
        TreasuryWithdrawn(_userKey, _withdrawnAmount);
        return OK;
    }
}