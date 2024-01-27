contract c7306{
    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    // 
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public is_not_locked(msg.sender) is_not_locked(from) validate_position(from,tokens) returns (bool success) {
        require(transferFromCheck(from,to,tokens));
        return true;
    }
}