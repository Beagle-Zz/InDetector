contract c7777{
    /**
     * Get the token balance for account `tokenOwner`
     */
    function balanceOf(address tokenOwner) public view returns (uint256 balanceOfOwner) {
        return balances[tokenOwner];
    }
}