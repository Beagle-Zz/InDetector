contract c7071{
    /// Deposits ARP.
    function deposit() private {
        uint256 amount = arpToken
            .balanceOf(msg.sender)
            .min256(arpToken.allowance(msg.sender, address(this)));
        require(amount > 0);
        Record storage record = records[msg.sender];
        record.amount = record.amount.add(amount);
        // solium-disable-next-line security/no-block-members
        record.timestamp = now;
        records[msg.sender] = record;
        arpDeposited = arpDeposited.add(amount);
        uint256 bonus = amount.div(BONUS_SCALE);
        if (bonus > 0) {
            arpToken.safeTransferFrom(owner, msg.sender, bonus);
        }
        arpToken.safeTransferFrom(msg.sender, address(this), amount);
        emit Deposit(depositId++, msg.sender, amount, bonus);
    }
}