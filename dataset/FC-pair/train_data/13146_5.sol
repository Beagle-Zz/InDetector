contract c13146{
// ------------------------------------------------------------------------
// --- Returns the amount of tokens approved by the owner
// ------------------------------------------------------------------------
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}