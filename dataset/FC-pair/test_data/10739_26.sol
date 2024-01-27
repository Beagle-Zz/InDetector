contract c10739{
    /**
     * @dev close the ICO
     */
    function closeSale() public onlyOwner {
        saleClosed = true;
        token.mint(owner, TOTAL_TOKEN_SUPPLY.sub(token.totalSupply()));
        token.finishMinting();
        token.transferOwnership(owner);
    }
}