contract c4902{
    /* EXTERNAL */
    /// @notice Deposits tokens on behalf of users
    /// Allowed only for oracle.
    ///
    /// @param _userKey aggregated user key (user ID + role ID)
    /// @param _value amount of tokens to deposit
    /// @param _feeAmount amount of tokens that will be taken from _value as fee
    /// @param _feeAddress destination address for fee transfer
    /// @param _lockupDate lock up date for deposit. Until that date the deposited value couldn't be withdrawn
    ///
    /// @return result code of an operation
    function deposit(bytes32 _userKey, uint _value, uint _feeAmount, address _feeAddress, uint _lockupDate) external onlyOracle returns (uint) {
        require(_userKey != bytes32(0));
        require(_value != 0);
        require(_feeAmount < _value);
        ERC20 _token = ERC20(token);
        if (_token.allowance(msg.sender, address(this)) < _value) {
            return TREASURY_ERROR_TOKEN_NOT_SET_ALLOWANCE;
        }
        uint _depositedAmount = _value - _feeAmount;
        _makeDepositForPeriod(_userKey, _depositedAmount, _lockupDate);
        uint _periodsCount = periodsCount;
        user2lastPeriodParticipated[_userKey] = _periodsCount;
        delete periods[_periodsCount].startDate;
        if (!_token.transferFrom(msg.sender, address(this), _value)) {
            revert();
        }
        if (!(_feeAddress == 0x0 || _feeAmount == 0 || _token.transfer(_feeAddress, _feeAmount))) {
            revert();
        }
        TreasuryDeposited(_userKey, _depositedAmount, _lockupDate);
        return OK;
    }
}