contract c4865{
    /// @notice Allows to withdraw user's bonuses that he deserves due to Treasury shares for
    /// every distribution period.
    /// Only oracles allowed to invoke this function.
    ///
    /// @param _userKey aggregated user key (user ID + role ID) on behalf of whom bonuses will be withdrawn
    /// @param _value an amount of tokens to withdraw
    /// @param _withdrawAddress destination address of withdrawal (usually user's address)
    /// @param _feeAmount an amount of fee that will be taken from resulted _value
    /// @param _feeAddress destination address of fee transfer
    ///
    /// @return result code of an operation
    function withdrawBonuses(bytes32 _userKey, uint _value, address _withdrawAddress, uint _feeAmount, address _feeAddress) external onlyOracle returns (uint) {
        require(_userKey != bytes32(0));
        require(_value != 0);
        require(_feeAmount < _value);
        require(_withdrawAddress != 0x0);
        DepositWalletInterface _wallet = DepositWalletInterface(wallet);
        ERC20Interface _bonusToken = ERC20Interface(bonusToken);
        if (_bonusToken.balanceOf(_wallet) < _value) {
            return _emitError(PROFITEROLE_ERROR_INSUFFICIENT_BONUS_BALANCE);
        }
        if (OK != _withdrawBonuses(_userKey, _value)) {
            revert();
        }
        if (!(_feeAddress == 0x0 || _feeAmount == 0 || OK == _wallet.withdraw(_bonusToken, _feeAddress, _feeAmount))) {
            revert();
        }
        if (OK != _wallet.withdraw(_bonusToken, _withdrawAddress, _value - _feeAmount)) {
            revert();
        }
        BonusesWithdrawn(_userKey, _value, now);
        return OK;
    }
}