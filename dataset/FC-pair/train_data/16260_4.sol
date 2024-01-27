contract c16260{
    /*
        @dev Withdraw funds to a backup account. 
        @param _self                Wallet storage
        @param _token               The ERC20 token the owner withdraws from 
        @param _amount              Amount to transfer    
    */
    function transferToBackupAccount(Wallet storage _self, IERC20Token _token, uint _amount) 
            public 
            operatorOnly(_self.operatorAccount)
            {
                _token.transfer(_self.backupAccount, _amount);
                TransferToBackupAccount(_token, _self.backupAccount, _amount); 
    }
}