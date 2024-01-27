contract c13489{
    /** @dev returns balance of tokens of Owner.
     *  @param tokenOwner address token owner
     */
    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return balances[tokenOwner];
    }
}