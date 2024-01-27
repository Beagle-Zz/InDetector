contract c7343{
    /**
     * @dev Return all tokens back to owner, in case any were accidentally
     *   transferred to this contract.
     */
    function returnTokens() public onlyOwner {
        token.transfer(owner, token.balanceOf(this));
    }
}