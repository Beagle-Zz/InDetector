contract c16260{
    /*
        @dev Withdraw funds to the user account. 
        @param _self                Wallet storage
        @param _token               The ERC20 token the owner withdraws from 
        @param _amount              Amount to transfer  
        @param _fee                 Fee to transfer   
    */
    function transferToUserWithdrawalAccount(Wallet storage _self, IERC20Token _token, uint _amount, IERC20Token _feesToken, uint _fee) 
            public 
            operatorOnly(_self.operatorAccount)
            validAddress(_self.userWithdrawalAccount)
            {
                if (_fee > 0) {        
                    _feesToken.transfer(_self.feesAccount, _fee); 
                }       
                _token.transfer(_self.userWithdrawalAccount, _amount);
                TransferToUserWithdrawalAccount(_token, _self.userWithdrawalAccount, _amount,  _feesToken, _self.feesAccount, _fee);   
    }
}