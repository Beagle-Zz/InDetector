contract c18089{
    /**
     * @dev Set LockedTokens contract address
     */
    function setLockedTokens(address lockedTokensAddress) public onlyOwner {
        lockedTokens = LockedTokens(lockedTokensAddress);
    }
}