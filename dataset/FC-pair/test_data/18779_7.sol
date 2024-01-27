contract c18779{
    // Get the contract token balance
    function tokensRemaining() public constant returns (uint256) {
        return token.balanceOf(this);
    }
}