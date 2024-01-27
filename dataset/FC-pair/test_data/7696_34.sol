contract c7696{
    // ------------------------------------------------------------------------
    // ERC20 approve:
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
    // recommends that there are no checks for the approval double-spend attack
    // as this should be implemented in user interfaces 
    // ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public returns (bool success) {
        require(frozen == false); 
        require(bitmask_check(msg.sender, 1024) == false); // banned == false
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
}