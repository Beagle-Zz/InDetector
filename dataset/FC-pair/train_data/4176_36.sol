contract c4176{
    // Withdraw a bid that was overbid.
    function withdraw() external returns (bool) {
        uint amount = pendingWithdrawals[msg.sender];
        if (amount > 0) {
            // It is important to set this to zero because the recipient
            // can call this function again as part of the receiving call
            // before `send` returns.
            pendingWithdrawals[msg.sender] = 0;
            if (!msg.sender.send(amount)) {
                // No need to call throw here, just reset the amount owing
                pendingWithdrawals[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }
}