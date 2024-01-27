contract c1592{
    /*
        @dev user perform withdraw. 
        @param _self                Wallet storage
        @param _token               The ERC20 token the owner withdraws from 
    */
    function performUserWithdraw(Wallet storage _self, IERC20Token _token)
        public
        userWithdrawalAccountOnly(_self)
        {
            require(_self.withdrawAllowedAt != 0 &&
                    _self.withdrawAllowedAt <= now );
            uint userBalance = _token.balanceOf(this);
            _token.transfer(_self.userWithdrawalAccount, userBalance);
            emit PerformUserWithdraw(_token, _self.userWithdrawalAccount, userBalance);   
        }
}