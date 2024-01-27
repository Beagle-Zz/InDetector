contract c11924{
    // ------------------------------------------------------------------------
    // Get the token balance for account _tokenOwner
    // ------------------------------------------------------------------------
    function balanceOf(address _tokenOwner) public constant returns (uint balance) {
        return balances[_tokenOwner];
    }
}