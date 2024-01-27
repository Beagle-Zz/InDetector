contract c16260{
    /*
        @dev Initialize the wallet with the operator and backupAccount address
        @param _self                        Wallet storage
        @param _backupAccount               Operator account to release funds in case the user lost his withdrawal account
        @param _operator                    The operator account
        @param _feesAccount                 The account to transfer fees to
    */
    function initWallet(Wallet storage _self, address _backupAccount, address _operator, address _feesAccount) 
            public
            validAddress(_backupAccount)
            validAddress(_operator)
            validAddress(_feesAccount)
            {
                _self.operatorAccount = _operator;
                _self.backupAccount = _backupAccount;
                _self.feesAccount = _feesAccount;
    }
}