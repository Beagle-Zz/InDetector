contract c3554{
    // ------------------------------------------------------------------------
    // ERC20 balanceOf: Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return accounts[tokenOwner].balance;
    }
}