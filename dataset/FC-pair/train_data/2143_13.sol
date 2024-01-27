contract c2143{
    /*
        @dev Fire the WithdrawalRequested event. 
        @param _userWithdrawalAccount   User withdrawal account address
        @param _sender                  The user account, activating this request
     */
    function emitWithrawalRequestEvent(address _userWithdrawalAccount, address _sender) 
        public
        {
            emit WithdrawalRequested(_userWithdrawalAccount, _sender);
    }
}