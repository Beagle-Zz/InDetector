contract c2545{
    /// @dev Sends the disbursement amount to the wallet after the disbursement period has passed. Can be called by anyone.
    function sendFundsToWallet() external atState(State.Closed) {
        require(nextDisbursement <= now);
        if (disbursementDuration == 0) {
            trustedWallet.transfer(address(this).balance);
            return;
        }
        uint256 numberOfDisbursements = now.sub(nextDisbursement).div(disbursementDuration).add(1);
        nextDisbursement = nextDisbursement.add(disbursementDuration.mul(numberOfDisbursements));
        transferToWallet(disbursementWei.mul(numberOfDisbursements));
    }
}