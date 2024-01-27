contract c18357{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to to account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public whenNotPaused returns (bool success) {
        return transferInt(msg.sender, to, tokens, true);
    }
}