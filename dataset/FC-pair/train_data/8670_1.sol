contract c8670{
                // ------------------------------------------------------------------------
                // Get the token balance for account tokenOwner
                // ------------------------------------------------------------------------
                function balanceOf(address tokenOwner) public constant returns (uint balance) {
                    return balances[tokenOwner];
                }
}