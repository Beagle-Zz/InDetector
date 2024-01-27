contract c16437{
    /*
        @dev Setting the account of the user to send funds to. 
        @param _self                        Wallet storage
        @param _userWithdrawalAccount       The user account to withdraw funds to
    */
    function setUserWithdrawalAccount(Wallet storage _self, address _userWithdrawalAccount) 
            public
            operatorOnly(_self.operatorAccount)
            validAddress(_userWithdrawalAccount)
            addressNotSet(_self.userWithdrawalAccount)
            {
                _self.userWithdrawalAccount = _userWithdrawalAccount;
                SetUserWithdrawalAccount(_userWithdrawalAccount);
    }
}