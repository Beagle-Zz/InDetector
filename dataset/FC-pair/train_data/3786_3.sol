contract c3786{
    /// @dev Calculates if an amount of tokens exceeds the aggregate daily limit of 15% of contract
    ///        balance or 5% of the contract balance on its own.
    function permissibleTokenWithdrawal(uint _toWithdraw)
        public
        returns(bool)
    {
        uint currentTime     = now;
        uint tokenBalance    = ZTHTKN.balanceOf(address(this));
        uint maxPerTx        = (tokenBalance.mul(MAX_WITHDRAW_PCT_TX)).div(100);
        require (_toWithdraw <= maxPerTx);
        if (currentTime - dailyResetTime >= resetTimer)
            {
                dailyResetTime     = currentTime;
                dailyTknLimit      = (tokenBalance.mul(MAX_WITHDRAW_PCT_DAILY)).div(100);
                tknsDispensedToday = _toWithdraw;
                return true;
            }
        else
            {
                if (tknsDispensedToday.add(_toWithdraw) <= dailyTknLimit)
                    {
                        tknsDispensedToday += _toWithdraw;
                        return true;
                    }
                else { return false; }
            }
    }
}