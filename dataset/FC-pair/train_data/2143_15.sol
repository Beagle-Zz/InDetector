contract c2143{
    /*
        @dev Initialize the wallet with the operator and backupAccount address
        @param _self                        Wallet storage
        @param _operator                    The operator account
        @param _feesAccount                 The account to transfer fees to
    */
    function initWallet(Wallet storage _self, address _operator, address _feesAccount) 
            public
            validAddress(_operator)
            validAddress(_feesAccount)
            {
                _self.operatorAccount = _operator;
                _self.feesAccount = _feesAccount;
    }
}