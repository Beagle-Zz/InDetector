contract c11337{
    /**
     * @dev returns unclaimed tokens to the airdropper after the airdrop expires
     * @param _tokenAddress is the address of the token
     */
    function returnTokensToAirdropper(address _tokenAddress) public ifNotPaused {
        require(tokenWhitelist[_tokenAddress]); // Token must be whitelisted first
        // Get the token
        uint tokensToReturn = 0;
        for (uint i =0; i<airdroppedTokens[_tokenAddress].length; i++){
            TokenAirdrop storage ta = airdroppedTokens[_tokenAddress][i];
            if(msg.sender == ta.tokenOwner &&
                airdropHasExpired(_tokenAddress,i)){
                tokensToReturn = tokensToReturn.add(ta.tokenBalance);
                ta.tokenBalance = 0;
            }
        }
        E_TokensWithdrawn(_tokenAddress,msg.sender,tokensToReturn,now);
    }
}