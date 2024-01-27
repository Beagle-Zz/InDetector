contract c4699{
    // ------------------------------------------------------------------------
    // ERC20 transfer:
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        require(frozen == false); 
        require(to != address(0));
        require(bitmask_check(to, 1024) == false); // banned == false
        //Fixing amount, deleting burned decimals
        tokens = fix_amount(tokens);
        // Checking if greater then 0
        require(tokens>0);
        //Refreshing accs, payng dividends
        updateAccount(to);
        updateAccount(msg.sender);
        uint fromOldBal = accounts[msg.sender].balance;
        uint toOldBal = accounts[to].balance;
        accounts[msg.sender].balance = accounts[msg.sender].balance.sub(tokens);
        accounts[to].balance = accounts[to].balance.add(tokens);
        require(renewDec(fromOldBal, accounts[msg.sender].balance));
        require(renewDec(toOldBal, accounts[to].balance));
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}