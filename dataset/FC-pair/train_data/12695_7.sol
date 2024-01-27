contract c12695{
    /**
     * @notice Lets participants withdraw the funds if `fundingGoal` was missed.
     * @notice Lets treasury collect the funds if `fundingGoal` was reached.
     * @dev The contract is obligated to return the ETH to contributors if `fundingGoal` isn't reached,
     *      so we have to wait until the end for a user withdrawal.
     * @dev The treasury can withdraw right after `fundingGoal` is reached.
     */
    function safeWithdrawal() afterDeadline stopOnPause{
        if (!fundingGoalReached && now >= finalDeadline) {
            uint amount = ethBalances[msg.sender];
            ethBalances[msg.sender] = 0;
            if (amount > 0) {
                if (msg.sender.send(amount)) {
                    emit FundsWithdrawn(msg.sender, amount);
                } else {
                    ethBalances[msg.sender] = amount;
                }
            }
        }
        else if (fundingGoalReached && treasury == msg.sender) {
            if (treasury.send(weiRaised)) {
                emit FundsWithdrawn(treasury, weiRaised);
            } else if (treasury.send(address(this).balance)){
                emit FundsWithdrawn(treasury, address(this).balance);
            }
        }
    }
}