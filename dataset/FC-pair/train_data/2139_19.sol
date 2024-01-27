contract c2139{
    /*
        @dev user request withdraw. 
        @param _self                Wallet storage
        @param _token               The ERC20 token the owner withdraws from 
    */
    function requestWithdraw(Wallet storage _self) 
        public 
        userWithdrawalAccountOnly(_self)
        {
            WithdrawalConfigurations withdrawalConfigurations = WithdrawalConfigurations(withdrawalConfigurationsContract);
            _self.withdrawAllowedAt = safeAdd(now, withdrawalConfigurations.getWithdrawalCoolingPeriod());
            withdrawalConfigurations.emitWithrawalRequestEvent(_self.userWithdrawalAccount, msg.sender);
    }
}