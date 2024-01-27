contract c2054{
    // this function can be called by the contributor to claim his BTNT tokens at the end of the ICO
    function claimBitNauticTokens() public returns (bool) {
        return grantContributorTokens(msg.sender);
    }
}