contract c18259{
    /**
     * @dev Called by owner of locked tokens to release them
     */
    function releaseTokens() public {
        require(walletTokens[msg.sender].length > 0);
        for(uint256 i = 0; i < walletTokens[msg.sender].length; i++) {
            if(!walletTokens[msg.sender][i].released && now >= walletTokens[msg.sender][i].lockEndTime) {
                walletTokens[msg.sender][i].released = true;
                token.transfer(msg.sender, walletTokens[msg.sender][i].amount);
                TokensUnlocked(msg.sender, walletTokens[msg.sender][i].amount);
            }
        }
    }
}