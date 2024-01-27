contract c11047{
    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function balanceOf(address owner) public constant returns(uint256 balance) {
        return balances[owner];
    }
}