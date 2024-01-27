contract c10476{
    // Returns the senders balance
    function getBalance() public view
    returns (uint256 amount) {
        return pendingWithdrawals[msg.sender];
    }
}