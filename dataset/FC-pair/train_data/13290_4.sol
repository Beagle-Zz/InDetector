contract c13290{
    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    // ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public returns (bool success) {
        // Ownly allow changes to or from 0. Mitigates vulnerabiilty of race description
        // described here: https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require((tokens == 0) || (allowed[msg.sender][spender] == 0));
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
}