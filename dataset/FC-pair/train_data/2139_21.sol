contract c2139{
    /*
        @dev Setting the account of the user to send funds to. 
        @param _userWithdrawalAccount       The user account to withdraw funds to
    */
    function setUserWithdrawalAccount(address _userWithdrawalAccount) public {
        wallet.setUserWithdrawalAccount(_userWithdrawalAccount);
    }
}