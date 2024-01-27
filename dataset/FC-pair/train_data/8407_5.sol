contract c8407{
// ------------------------------------------------------------------------
// --- Returns the amount of tokens approved by the owner that can be transferred
// ------------------------------------------------------------------------
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}