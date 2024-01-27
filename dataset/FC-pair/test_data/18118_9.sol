contract c18118{
    /**
     * Quick withdrawal, needs to send ether to this function for the fee.
     *
     * Gas use: ? (including call to processWithdrawal)
    */
    function quickWithdraw() payable notPendingWithdrawal returns (bool) {
        uint256 amount = balanceOf[msg.sender];
        if (amount == 0) throw;
        // calculate required fee
        uint256 feeRequired = calculateFee(amount);
        if (msg.value != feeRequired) {
            IncorrectFee(msg.sender, feeRequired);   // notify the exact fee that needs to be sent
            throw;
        }
        feePot += msg.value;                         // add fee to the feePot
        doWithdrawal(0);                             // withdraw, 0 reward
        WithdrawalDone(msg.sender, amount, 0);
        return true;
    }
}