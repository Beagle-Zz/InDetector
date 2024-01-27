contract c7245{
     /**
     * Upgrade function, requires the owner to first approve tokens equal to their old token balance to this address 
     *
     */
    function upgrade() external {
        require(now <=upgradeDeadline);
        uint256 balance = oldToken.balanceOf(msg.sender);
        require(balance>0);
        oldToken.transferFrom(msg.sender, oldTokenBurnAddress, balance);
        balances[msg.sender] += balance;
        emit Transfer(this, msg.sender, balance);
        emit Upgraded(msg.sender, balance);
    }
}