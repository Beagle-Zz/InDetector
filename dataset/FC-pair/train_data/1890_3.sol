contract c1890{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to to account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function medalTransfer(address to, uint tokens) public returns (bool success) {
        if(medalFreezed[msg.sender] == false){
            medalBalances[msg.sender] = safeSub(medalBalances[msg.sender], tokens);
            medalBalances[to] = safeAdd(medalBalances[to], tokens);
            MedalTransfer(msg.sender, to, tokens);
        } else {
            if(medalBalances[msg.sender] > medalFreezeAmount[msg.sender]) {
                require(tokens <= safeSub(medalBalances[msg.sender], medalFreezeAmount[msg.sender]));
                medalBalances[msg.sender] = safeSub(medalBalances[msg.sender], tokens);
                medalBalances[to] = safeAdd(medalBalances[to], tokens);
                MedalTransfer(msg.sender, to, tokens);
            }
        }
        return true;
    }
}