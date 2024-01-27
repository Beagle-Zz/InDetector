contract c16260{
    /*
        @dev Withdraw funds to the user account. 
        @param _token               The ERC20 token the owner withdraws from 
        @param _amount              Amount to transfer    
    */
    function transferToUserWithdrawalAccount(IERC20Token _token, uint _amount, IERC20Token _feesToken, uint _fee) public {
        wallet.transferToUserWithdrawalAccount(_token, _amount, _feesToken, _fee);
    }
}