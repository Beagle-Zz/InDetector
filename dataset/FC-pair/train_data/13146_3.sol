contract c13146{
// ------------------------------------------------------------------------
// --- Token owner can approve for `spender` to transferFrom
// ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
}