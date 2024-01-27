contract c7069{
    /// Withdraws ARP.
    function withdraw() private {
        require(arpDeposited > 0);
        Record storage record = records[msg.sender];
        require(record.amount > 0);
        // solium-disable-next-line security/no-block-members
        require(now >= record.timestamp.add(WITHDRAWAL_DELAY));
        uint256 amount = record.amount;
        delete records[msg.sender];
        arpDeposited = arpDeposited.sub(amount);
        arpToken.safeTransfer(msg.sender, amount);
        emit Withdrawal(withdrawId++, msg.sender, amount);
    }
}