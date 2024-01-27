contract c2175{
    /**
     * Withdraw the funds
     */
    function safeWithdrawal() isHuman() public {
        uint256 availableWithdrawal = players[msg.sender].balance - players[msg.sender].withdrawal;
        require(availableWithdrawal > 0);
        require(keyLocked == false);
        keyLocked = true;
        poolWithdraw += availableWithdrawal;
        players[msg.sender].withdrawal += availableWithdrawal;
        msg.sender.transfer(availableWithdrawal);
        keyLocked = false;
        emit Withdrawal(msg.sender, availableWithdrawal);
    }
}